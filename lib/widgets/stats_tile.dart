import 'package:flutter/material.dart';

class StatsTile extends StatelessWidget {
  final String? number;
  final String? item;

  const StatsTile({super.key, required this.number, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number ?? '0',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepOrangeAccent,
            fontSize: 32,
          ),
        ),
        Text(
          item ?? '--',
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
