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

  void _clearAllFilters() {
    _titleController.clear();
    _locationController.clear();
    _durationController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Filters ',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Profile'),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: _durationController,
              decoration: InputDecoration(labelText: 'Duration'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shadowColor: Colors.grey,
        color: Colors.white,
        elevation: 20,
        child: Container(
          // height: 2,
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: TextButton(
                    onPressed: _clearAllFilters,
                    child: Center(
                      child: Text(
                        'Clear All',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.blue,
                  ),
                  child: TextButton(
                    onPressed: () {
                      widget.onApplyFilters(
                        _titleController.text,
                        _locationController.text,
                        _durationController.text,
                      );
                      Navigator.pop(context);
                    },
                    // padding: const EdgeInsets.only(top: 1.0),
                    child: Center(
                      child: Text(
                        'Apply Filters',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
