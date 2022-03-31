import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  const Dropdown(
      {Key? key,
      required this.listItem,
      required this.newValue,
      required this.onDropdownChange})
      : super(key: key);

  final List<String> listItem;
  final String newValue;
  final Function(dynamic) onDropdownChange;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: listItem.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: newValue,
      onChanged: onDropdownChange,
    );
  }
}