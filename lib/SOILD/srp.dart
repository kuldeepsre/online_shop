import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemListWidget extends StatelessWidget {
  final List<String> items;
  final void Function(String) onItemSelected; // Callback function type

  const ItemListWidget({
    Key? key,
    required this.items,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
          onTap: () => onItemSelected(items[index]), // Calling the callback function
        );
      },
    );
  }
}