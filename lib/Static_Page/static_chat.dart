import 'package:flutter/material.dart';

Color scaffoldBackgroundColor = const Color(0xFFFFFFFF);
Color cardColor = const Color(0xFF3F51B5);

class StaticChat extends StatelessWidget {
  const StaticChat({
    super.key,
    required this.msg,
    required this.chatIndex,
  });

  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (chatIndex == 0)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          'images/technician.png',
                          height: 35,
                          width: 35,
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  flex: 10,
                  child: chatIndex == 0
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2, 30, 0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: EdgeInsets.all(9.0),
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.5,
                                  ),
                                ],
                                color: Colors.grey,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: DefaultTextStyle(
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                                child: Text(msg.trim()),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                padding: EdgeInsets.all(9.0),
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.indigo,
                                      blurRadius: 0.5,
                                    ),
                                  ],
                                  color: Colors.indigo,
                                  border: Border.all(color: Colors.indigo),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  msg.trim(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                if (chatIndex != 0)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 2.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          'images/circular_avatar.png',
                          height: 35,
                          width: 35,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChatScreens extends StatefulWidget {
  const ChatScreens({super.key});
  static const routeStatic = '/ChatScreens';
  @override
  State<ChatScreens> createState() => _ChatScreensState();
}

class _ChatScreensState extends State<ChatScreens> {
  bool _isTyping = false;
  late TextEditingController textController;
  late ScrollController _listScrollController;
  late FocusNode focusNode;

  void initState() {
    _listScrollController = ScrollController();
    textController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: cardColor,
          elevation: 2,
          title: Text(
            'History',
            style: TextStyle(color: Colors.white),
          )),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  controller: _listScrollController,
                  itemCount: chatMessages.length, //chatList.length,
                  itemBuilder: (context, index) {
                    return StaticChat(
                      msg: chatMessages[index]["msg"]
                          .toString(), // chatList[index].msg,
                      chatIndex: int.parse(chatMessages[index]["chatIndex"]
                          .toString()), //chatList[index].chatIndex,
                    );
                  }),
            ),
            Material(
              color: cardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        focusNode: focusNode,
                        controller: textController,
                        decoration: const InputDecoration.collapsed(
                            hintText: "Describe your issue",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget(
      {Key? key,
      required this.label,
      this.fontSize = 16,
      this.color,
      this.fontWeight})
      : super(key: key);

  final String label;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      // textAlign: TextAlign.justify,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w700,
      ),
    );
  }
}

final chatMessages = [
  {
    "msg": "How may i assist you ?",
    "chatIndex": 0,
  },
  {
    "msg": "My AC is not working recently",
    "chatIndex": 1,
  },
  {
    "msg":
        "Can you please give the \"Address details\" or \"Home Id\" to service you",
    "chatIndex": 0,
  },
  {
    "msg":
        "My address is 12th Main Road, Vijaya Nagar,. Velacheri, Chennai - 600 042",
    "chatIndex": 1,
  },
  {
    "msg": "Can you please specify the AC issue?",
    "chatIndex": 0,
  },
  {
    "msg": "The AC is not Switching On from two days before",
    "chatIndex": 1,
  },
  {
    "msg": "Are you using frequently, when do you service your AC last time",
    "chatIndex": 0,
  },
  {
    "msg": "It's been a year, i serviced it",
    "chatIndex": 1,
  },
  {
    "msg":
        "The issue will be resolved shortly. Our Technician will reach your home within half an hour",
    "chatIndex": 0,
  },
  {
    "msg": "Thank you",
    "chatIndex": 1,
  },
];
