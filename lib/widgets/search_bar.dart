import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CustomSearchBar extends StatelessWidget { // Renamed to CustomSearchBar
  String description;
  CustomSearchBar(this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: description,
          icon: Icon(Icons.search), // Use Flutter's built-in search icon as an alternative
          border: InputBorder.none,
        ),
      ),
    );
  }
}
