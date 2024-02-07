import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_app/content.dart';

class ItemWidget extends StatefulWidget {
  final Content Item;
  final int index;
  final Function onDelete;

  const ItemWidget(
      {super.key,
      required this.index,
      required this.onDelete,
      required this.Item});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.Item.image != null)
              Image.file(File(widget.Item.image!.path)),
            if (widget.Item.image == null) Image.asset('images/img-1.png'),
            Stack(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'Maintenance'),
                  initialValue: 'AC',
                  onChanged: (value) => widget.Item.title = value,
                ),
                // if (widget.Item.isChecked)
                //   Positioned(
                //     top: 0,
                //     bottom: 0,
                //     left: 0,
                //     right: 0,
                //     child: Container(
                //       color: Colors.grey
                //           .withOpacity(0.5), // Adjust opacity as needed
                //     ),
                //   ),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Description'),
              initialValue:
                  ' Air conditioner making different sounds while switched on',
              onChanged: (value) => widget.Item.description = value,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Checkbox(
                //   value: widget.Item.isChecked,
                //   onChanged: (value) =>
                //       setState(() => widget.Item.isChecked = value!),
                // ),
                IconButton(
                  onPressed: () => widget.onDelete(widget.index),
                  icon: Icon(Icons.delete),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
