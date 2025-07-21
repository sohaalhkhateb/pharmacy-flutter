import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
            ),
            child: Image(
              image: AssetImage('assets/images/22.png'),
            ),
          ),
        ),
      ],
    );
  }
}
