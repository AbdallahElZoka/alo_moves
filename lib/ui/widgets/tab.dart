import 'package:flutter/material.dart';

class TabSelector extends StatelessWidget {
  bool selected;
  String title;

  TabSelector({super.key, required this.selected, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        border: selected
            ? const Border(
                bottom: BorderSide(color: Colors.black),
              )
            : null,
      ),
      child: Text(
        title ?? "",
        style: const TextStyle(color: Colors.black,fontSize: 12),
      ),
    );
  }
}
