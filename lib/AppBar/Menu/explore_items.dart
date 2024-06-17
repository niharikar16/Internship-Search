import 'package:flutter/material.dart';

class ExploreItems extends StatelessWidget {
  final IconData icon;
  final String title;

  ExploreItems({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.grey.shade800,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
