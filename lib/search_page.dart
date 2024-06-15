import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> internships = [];
  bool isLoading = true;
  String errorMessage = '';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Internships',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: false,
        actions: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.blue),
            ),
            onPressed: () {
              // Handle filter button press
            },
            child: Row(
              children: [
                Icon(
                  Icons.filter_alt_rounded,
                  color: Colors.blue,
                ),
                SizedBox(width: 8),
                Text(
                  'Filters',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
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
                      margin: EdgeInsets.symmetric(vertical: 6),
                      // elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Top Section: Internship Details
                          Padding(
                            padding: const EdgeInsets.all(16.0),
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
                                          'https://internshala.com/uploads/company_logo/${internship['company_logo']}',
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
                                Text(
                                  'Location: ${internship['location_names']?.join(', ') ?? 'N/A'}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[900],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Duration: ${internship['duration'] ?? 'N/A'}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[900],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Stipend: ${internship['stipend']?['salary'] ?? 'N/A'}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[900],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Posted on: ${internship['posted_on'] ?? 'N/A'}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[900],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Start Date: ${internship['start_date'] ?? 'N/A'}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[900],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Part-Time: ${internship['part_time'] ? 'Yes' : 'No'}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[900],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'PPO: ${internship['is_ppo'] ? 'Yes' : 'No'}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[900],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                          // Bottom Section: View Details Button
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Spacer(),
                                TextButton(
                                  onPressed: () {
                                    // Handle view details button press
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 16),
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: Text(
                                    'View Details',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
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
