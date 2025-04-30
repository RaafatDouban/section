import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final String? title;
  File? selectedImage;

  final IconData? icon;
  final VoidCallback? onpressed;
  Options({
    required this.onpressed,
    required this.title,
    this.selectedImage,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onpressed,
          icon: Icon(
            icon,
            size: 40,
            color: selectedImage != null ? Colors.red : Colors.grey.shade500,
          ),
          //Icon(),
        ),
        Text(title!),
      ],
    );
  }
}
