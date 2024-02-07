import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_app/content.dart';
import 'package:image_app/process.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final contents = Content.todoItems;

  void _showImagePickerOptions() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Image'),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => _pickImageFromGallery(),
              icon: Icon(Icons.photo_library),
            ),
            IconButton(
              onPressed: () => _pickImageFromCamera(),
              icon: Icon(Icons.camera_alt),
            ),
          ],
        ),
      ),
    );
  }

  void _pickImageFromGallery() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        contents.add(Content(image: image));
      });
    }
  }

  void _pickImageFromCamera() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        contents.add(Content(image: image));
      });
    }
  }

  void deleteItem(int index) {
    setState(() {
      contents.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.indigo,
        title: Text(
          'Service request',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // SingleChildScrollView(
          //   child: Container(
          //     height: 500,
          //     width: double.infinity,
          //     margin: EdgeInsets.all(20),
          //     padding: EdgeInsets.all(5),
          //     color: Colors.indigo,
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: contents.length,
              itemBuilder: (context, index) {
                return ItemWidget(
                  Item: contents[index],
                  index: index,
                  onDelete: deleteItem,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showImagePickerOptions,
        child: Icon(Icons.add),
      ),
    );
  }
}
