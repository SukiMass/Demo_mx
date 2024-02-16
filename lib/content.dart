import 'package:image_picker/image_picker.dart';

// To Store Image Title, Issue,description and to verify
class Content {
  final XFile? image;
  String? title;
  String? description;
  bool isChecked = false;

  Content({this.image});

  static List<Content> todoItems = [];
}


