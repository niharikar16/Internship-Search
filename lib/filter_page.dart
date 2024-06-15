import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  final String? selectedProfile;
  final String? selectedCity;
  final String? selectedDuration;

  FilterPage({this.selectedProfile, this.selectedCity, this.selectedDuration});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String? selectedProfile;
  String? selectedCity;
  String? selectedDuration;

  @override
  void initState() {
    super.initState();
    selectedProfile = widget.selectedProfile;
    selectedCity = widget.selectedCity;
    selectedDuration = widget.selectedDuration;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: selectedProfile,
              onChanged: (value) {
                setState(() {
                  selectedProfile = value;
                });
              },
              items: ['Data Science', 'Marketing', 'Engineering', 'Design']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Profile',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedCity,
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                });
              },
              items: ['Munnar', 'Delhi', 'Lucknow', 'Tarn Taran']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedDuration,
              onChanged: (value) {
                setState(() {
                  selectedDuration = value;
                });
              },
              items: ['1 Month', '2 Months', '3 Months', '6 Months']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Duration',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'profile': selectedProfile,
                  'city': selectedCity,
                  'duration': selectedDuration,
                });
              },
              child: Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }
}
