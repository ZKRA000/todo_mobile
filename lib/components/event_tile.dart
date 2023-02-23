import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  const EventTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 12),
            child: const Text('08 am'),
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 80,
                maxHeight: 120,
              ),
              child: Container(
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
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
