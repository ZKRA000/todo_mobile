import 'package:flutter/material.dart';

// style
import '../style/style.dart';

class AddTaskForm extends StatelessWidget {
  const AddTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 32.0,
      ),
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                style: h3,
                'Create New Task',
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close),
              )
            ],
          ),
          const SizedBox(height: 32.0),
          const Text(
            style: label,
            'Title',
          ),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: const BoxDecoration(
              color: Color(0xFFEDEDED),
              borderRadius: BorderRadius.all(
                Radius.circular(100.0),
              ),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Type Title',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            style: label,
            'Task Type',
          ),
          const SizedBox(height: 16.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              for (int x = 0; x < 5; x++)
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFDFD8C8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: const Text(
                      style: p,
                      'Work',
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20.0),
          const Text(
            style: label,
            'Detail',
          ),
          const SizedBox(height: 16.0),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'calendar-form');
            },
            child: Row(
              children: [
                const Icon(
                  Icons.add,
                  color: Color(0xFF52575D),
                ),
                const SizedBox(width: 12),
                Text(
                  style: h5.merge(
                    const TextStyle(
                      color: Color(0xFF52575D),
                    ),
                  ),
                  'Add Time',
                )
              ],
            ),
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              const Icon(
                Icons.add,
                color: Color(0xFF52575D),
              ),
              const SizedBox(width: 12),
              Text(
                style: h5.merge(
                  const TextStyle(
                    color: Color(0xFF52575D),
                  ),
                ),
                'Add Description',
              )
            ],
          )
        ],
      ),
    );
  }
}
