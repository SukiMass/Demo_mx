import 'package:flutter/material.dart';

class ItemList {
  final String imageUrl;
  final String title;
  final List<String> checklists;
  List<bool> isCheckedList;

  ItemList({
    required this.imageUrl,
    required this.title,
    required this.checklists,
  }) : isCheckedList = List.filled(checklists.length, false);

  bool get isCompleted =>
      isCheckedList.every((value) => value); // Efficient completion check
}

class ChecklistItem extends StatefulWidget {
  final String text;
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const ChecklistItem({
    required this.text,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  State<ChecklistItem> createState() => _ChecklistItemState();
}

class _ChecklistItemState extends State<ChecklistItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: widget.isChecked
              ? Icon(Icons.check_circle,color: Colors.green[600],)
              : Icon(Icons.check_circle_outline),
          onPressed: () => widget.onChanged(!widget.isChecked),
        ),
        Expanded(
          // Wrap text in Expanded widget
          child: Text(
            widget.text,
            overflow: TextOverflow.clip, // Enable ellipsis for overflow
          ),
        ),
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
              padding: const EdgeInsets.all(12.0),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: item.checklists.asMap().entries.map((entry) {
                          int checklistIndex = entry.key;
                          String checklistText = entry.value;

                          return ChecklistItem(
                            text: checklistText,
                            isChecked: item.isCheckedList[checklistIndex],
                            onChanged: (newValue) {
                              setState(() {
                                // Update completed checklists based on newValue
                                item.isCheckedList[checklistIndex] = newValue;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                      ),
                        onPressed: item.isCompleted
                            ? () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          elevation: 16,
                                          child: Container(
                                            color: Colors.indigo,
                                              padding: EdgeInsets.all(15),
                                              margin: EdgeInsets.all(10),
                                              child: Text(
                                                'Great work! You\'ve successfully completed all necessary steps. You\'ve addressed all repairs outlined in the checklist',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),
                                              )));
                                    });
                              }
                            : null,
                        child: Text(
                          'Complete',
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
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
  // ItemList(
  //   imageUrl: 'images/tv.jpg',
  //   title: 'There is lines in the TV',
  //   checklists: [
  //     'Checklist 1',
  //     'Checklist 2',
  //     'Checklist 3',
  //     'Checklist 4',
  //     'Checklist 5',
  //   ],
  // ),
];

// void main() {
//   runApp(MaterialApp(
//     home: MyList(actualList: actualList),
//   ));
// }
