import 'package:flutter/material.dart';
import 'package:library_system/styles/typo.dart';

class InputField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const InputField({super.key, required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 120,
          child: Text(title, style: TypoType.bodyBold.getStyle()),
        ),
        SizedBox(
          width: 200,
          child: TextField(controller: controller),
        ),
      ],
    );
  }
}
