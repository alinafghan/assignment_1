import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String? title;
  final String? datetime;
  final String? address;
  final String? name;
  const MyCard(
      {super.key,
      required this.title,
      required this.datetime,
      required this.address,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Card(
        elevation: 12,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/profile.jpg'),
                    )),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? 'Untitled',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(datetime ?? '-- -- --'),
                Text(address ?? 'Unknown Address'),
                Text(name ?? 'Unnamed Person')
              ],
            )
          ],
        ),
      ),
    );
  }
}
