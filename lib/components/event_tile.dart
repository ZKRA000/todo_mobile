import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  const EventTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
          color: const Color(0xFFDAF1F9),
          borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF6096B4),
              fontSize: 16,
            ),
            'family',
          ),
          SizedBox(height: 8),
          Text(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            'Breakfast in the cafe and relax',
          ),
          SizedBox(height: 8),
          Text(
            style: TextStyle(
              color: Color(0xFF838383),
              fontWeight: FontWeight.w600,
            ),
            '08:00 am - 10:00 am',
          )
        ],
      ),
    );
  }
}
