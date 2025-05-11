import 'package:flutter/material.dart';

class CarType extends StatelessWidget {
  const CarType({required this.url, required this.text, super.key});
  final String url;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                url,
              ),
            ),
            Container(
              width: 120,
              color: Colors.black.withAlpha(5),
              padding: const EdgeInsets.all(4),
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
