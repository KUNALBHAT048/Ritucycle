import 'package:flutter/material.dart';
import '../components/calendar_widget.dart';
import '../widgets/period_card.dart';
import '../widgets/symptom_card.dart';
import '../widgets/tutorial_card.dart';
import '../widgets/chat_card.dart';
import '../widgets/routine_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RituCycle - Caring for Women\'s Hygiene'),
        backgroundColor: Colors.pink[200],
      ),
      body: Column(
        children: [
          // Calendar section with a little padding
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CalendarWidget(),
          ),
          // Expanded section to avoid overflow issues
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PeriodCard(),
                  SymptomCard(),
                  TutorialCard(),
                  ChatCard(),
                  RoutineCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
