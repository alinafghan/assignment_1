import 'package:flutter/material.dart';

class CommentTile extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? datetime;

  const CommentTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.datetime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? 'Title',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon((Icons.reply)),
              SizedBox(width: 4),
              Text(
                subtitle ?? 'This is a subtitle.',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(width: 30),
              Text(
                datetime ?? '-- -- --',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
