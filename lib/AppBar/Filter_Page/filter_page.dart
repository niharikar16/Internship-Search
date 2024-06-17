import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  final Function(String, String, String) onApplyFilters;

  FilterPage({required this.onApplyFilters});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Internships'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: _durationController,
              decoration: InputDecoration(labelText: 'Duration'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.onApplyFilters(
                  _titleController.text,
                  _locationController.text,
                  _durationController.text,
                );
                Navigator.pop(context);
              },
              child: Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }
}
