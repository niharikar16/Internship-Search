import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:internship_search/Search_Page/view_details_page.dart'; // Ensure this import matches the actual path
import 'package:internship_search/AppBar/custom_appbar.dart';
import 'package:internship_search/AppBar/Menu/custom_navbar.dart';
// import 'package:internship_search/se';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> internships = [];
  List<dynamic> originalInternships = [];
  bool isLoading = true;
  String errorMessage = '';

  String _title = '';
  String _location = '';
  String _duration = '';

  @override
  void initState() {
    super.initState();
    fetchInternships();
  }

  Future<void> fetchInternships() async {
    try {
      final response = await http
          .get(Uri.parse('https://internshala.com/flutter_hiring/search'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final internshipsMeta =
            data['internships_meta'] as Map<String, dynamic>;
        final internshipsList = internshipsMeta.values.toList();
        setState(() {
          internships = internshipsList;
          originalInternships = List.from(internships); // Store original data
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load internships: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load internships: $e';
        isLoading = false;
      });
    }
  }

  void _applyFilters(String title, String location, String duration) {
    setState(() {
      _title = title;
      _location = location;
      _duration = duration;

      if (title.isEmpty && location.isEmpty && duration.isEmpty) {
        // If all filters are empty, reset to original data
        internships.clear();
        internships.addAll(originalInternships);
      } else {
        // Apply filters based on title, location, and duration
        internships.clear();
        internships.addAll(originalInternships.where((internship) {
          final matchesTitle = title.isEmpty ||
              internship['title'].toLowerCase().contains(title.toLowerCase());

          final matchesLocation = location.isEmpty ||
              internship['location_names']
                  .toString()
                  .toLowerCase()
                  .contains(location.toLowerCase());

          final matchesDuration = duration.isEmpty ||
              _containsDuration(internship['duration'], duration.toLowerCase());

          return matchesTitle && matchesLocation && matchesDuration;
        }).toList());
      }
    });
  }

  bool _containsDuration(String? fullDuration, String queryDuration) {
    if (fullDuration == null || fullDuration.isEmpty) return false;

    final fullDurationLower = fullDuration.toLowerCase();
    final queryDurationLower = queryDuration.toLowerCase();

    // Check for exact match
    if (fullDurationLower == queryDurationLower) return true;

    // Check if fullDuration contains queryDuration as a substring
    if (fullDurationLower.contains(queryDurationLower)) return true;

    // Handle specific cases like "2 months" matching "2 month" or "2months"
    final fullWords = fullDurationLower.split(' ');
    final queryWords = queryDurationLower.split(' ');

    for (final queryWord in queryWords) {
      bool matched = false;
      for (final fullWord in fullWords) {
        if (fullWord.contains(queryWord) || queryWord.contains(fullWord)) {
          matched = true;
          break;
        }
      }
      if (!matched) return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      drawer: CustomNavbar(),
      appBar: CustomAppBar(onApplyFilters: _applyFilters),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : ListView.builder(
                  itemCount: internships.length,
                  itemBuilder: (context, index) {
                    var internship = internships[index];
                    return Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            internship['title'] ?? 'N/A',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            internship['company_name'] ?? 'N/A',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (internship['company_logo'] != null &&
                                        internship['company_logo'].isNotEmpty)
                                      Container(
                                        height: 50,
                                        width: 50,
                                        margin: EdgeInsets.only(left: 16),
                                        child: Image.network(
                                          internship['company_logo'],
                                          fit: BoxFit.contain,
                                          errorBuilder: (BuildContext context,
                                              Object exception,
                                              StackTrace? stackTrace) {
                                            return Icon(Icons.error);
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(children: [
                                  Icon(Icons.work,
                                      color: Colors.grey.shade600, size: 16),
                                  SizedBox(width: 8),
                                  Text(
                                    internship['work_from_home'] != false
                                        ? 'Work from home'
                                        : 'On-site',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[900],
                                    ),
                                  ),
                                ]),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.play_circle,
                                        color: Colors.grey.shade600, size: 16),
                                    SizedBox(width: 8),
                                    Text(
                                      internship['start_date'] ?? 'N/A',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[900],
                                      ),
                                    ),
                                    SizedBox(width: 40),
                                    Icon(Icons.calendar_month_outlined,
                                        color: Colors.grey.shade600, size: 16),
                                    SizedBox(width: 8),
                                    Text(
                                      internship['duration'] ?? 'N/A',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[900],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.monetization_on,
                                        color: Colors.grey.shade600, size: 16),
                                    SizedBox(width: 8),
                                    Text(
                                      internship['stipend']?['salary'] ??
                                          'Unpaid',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[900],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 14),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 10),
                                      child: Text(
                                        internship['is_ppo']
                                            ? 'Internship with job offer'
                                            : 'Internship',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[900],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 10),
                                      child: Text(
                                        internship['part_time']
                                            ? 'Part Time'
                                            : 'Full Time',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[900],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 14),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.timelapse,
                                        color: Colors.grey.shade600,
                                        size: 20,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        internship['posted_on'] ?? 'N/A',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[900],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey.shade400,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailPage(internship: internship),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'View Details',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 6),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 14, horizontal: 16),
                                    backgroundColor: Colors.blue.shade600,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: Text(
                                    'Apply now',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
