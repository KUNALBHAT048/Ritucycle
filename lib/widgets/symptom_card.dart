import 'package:flutter/material.dart';

class SymptomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Adjust width as needed
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.pink[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.self_improvement, size: 48, color: Colors.green[700]),
          SizedBox(height: 10),
          Text(
            'Cure Issues With Yoga',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.pink[900],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Track your period and get insights.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.pink[800],
            ),
          ),
        ],
      ),
    );
  }
}
