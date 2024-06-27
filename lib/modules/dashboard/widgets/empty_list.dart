import 'package:flutter/material.dart';

class EmptyListContainer extends StatelessWidget {
  const EmptyListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.note_alt_outlined),
        Text("No recent transaction found. Please add first.")
      ],
    );
  }
}
