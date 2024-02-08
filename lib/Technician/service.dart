import 'package:flutter/material.dart';

class ItemList {
  final String imageUrl;
  final String title;
  final List<String> checklists;
  bool isCompleted;

  ItemList({
    required this.imageUrl,
    required this.title,
    required this.checklists,
    this.isCompleted = false,
  });
}

class ChecklistItem extends StatelessWidget {
  final String text;
  final bool isChecked;
  final ValueChanged onChanged;

  const ChecklistItem({
    required this.text,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: isChecked
              ? Icon(Icons.check_circle)
              : Icon(Icons.check_circle_outline),
          onPressed: () => onChanged(!isChecked),
        ),
        Text(text),
      ],
    );
  }
}

class MyList extends StatefulWidget {
  final List<ItemList> actualList;

  const MyList({required this.actualList});
  static const routeTech = '/ServiceScreeen';

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Upcoming Services',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.indigo,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: ListView.builder(
          itemCount: widget.actualList.length,
          itemBuilder: (context, index) {
            final item = widget.actualList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    verticalDirection: VerticalDirection.down,
                    children: [
                      Image.asset(
                        item.imageUrl,
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Text(
                        item.title,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo),
                      ),
                      Divider(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: item.checklists.map((checklist) {
                          return ChecklistItem(
                            text: checklist,
                            isChecked: item.checklists.indexOf(checklist) ==
                                item.isCompleted,
                            onChanged: (newValue) {
                              setState(() {
                                // Update completed checklists based on newValue
                                item.isCompleted = newValue;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    elevation: 16,
                                    child: Container(
                                        padding: EdgeInsets.all(15),
                                        child: Text(
                                          'Service Completed!',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.indigo),
                                        )));
                              });
                        },
                        child: Text(
                          'Complete',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

final actualList = [
  ItemList(
    imageUrl: 'images/ac1.jpg',
    title: 'AC is not working',
    checklists: [
      'Refrigerant - monitor operating pressures',
      'Thermostat - test for proper operation, calibrate and level',
      'Condensate Drain - flush and treat with anti-algae',
      'Electrical Wiring - inspect and tighten connections',
      'Clean condenser coil and remove debris',
    ],
  ),
  ItemList(
    imageUrl: 'images/fridge.jpg',
    title: 'Fridge is not cooling enough for the storage items',
    checklists: [
      'Deep Clean the Fridge and Freezer',
      'Clean the Condenser Coils',
      'Inspection of Wiring',
      'Grab a bubble level and test the top of the fridge,',
      'Change the Water Filter',
    ],
  ),
  ItemList(
    imageUrl: 'images/tv.jpg',
    title: 'There is lines in the TV',
    checklists: [
      'Checklist 1',
      'Checklist 2',
      'Checklist 3',
      'Checklist 4',
      'Checklist 5',
    ],
  ),
];

// void main() {
//   runApp(MaterialApp(
//     home: MyList(actualList: actualList),
//   ));
// }
