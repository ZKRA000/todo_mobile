import 'package:flutter/material.dart';

// component
import '../components/calendar.dart';

class CalendarForm extends StatefulWidget {
  const CalendarForm({super.key});

  @override
  State<CalendarForm> createState() => _CalendarForm();
}

class _CalendarForm extends State<CalendarForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 56.0),
            Calendar(),
          ],
        ),
      ),
    );
  }
}
