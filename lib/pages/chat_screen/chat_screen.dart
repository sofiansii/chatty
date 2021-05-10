import 'package:chatty/api/users.dart';
import 'package:chatty/pages/chat_screen/chat_block.dart';
import 'package:chatty/pages/chat_screen/info_bar.dart';
import 'package:chatty/pages/chat_screen/typing_bar.dart';
import 'package:chatty/pages/common/colors.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final User user;
  var thread = [
    {
      "who": "me",
      "type": "image",
      "url":
          "https://imgproxy.natucate.com/PAd5WVIh-tjEKQM4Z6tm6W1J4Yc2JIYWrKEroD1c7mM/rs:fill/g:ce/w:3840/h:2160/aHR0cHM6Ly93d3cubmF0dWNhdGUuY29tL21lZGlhL3BhZ2VzL3JlaXNlYXJ0ZW4vNmMwODZlYmEtNzk3Yi00ZDVjLTk2YTItODhhNGM4OWUyODdlLzM3NjYwMTQ2NjMtMTU2NzQzMzYxMi8xMl9kYW5pZWxfY2FuX2JjLTIwNy5qcGc"
    },
    {
      "who": "you",
      "type": "text",
      "text": "2 malware bytes is stealing user data lol..."
    },
    {
      "who": "you",
      "type": "text",
      "text": "2 hello there this is and exmaple message"
    },
    {
      "who": "you",
      "type": "image",
      "url":
          "https://imgproxy.natucate.com/PAd5WVIh-tjEKQM4Z6tm6W1J4Yc2JIYWrKEroD1c7mM/rs:fill/g:ce/w:3840/h:2160/aHR0cHM6Ly93d3cubmF0dWNhdGUuY29tL21lZGlhL3BhZ2VzL3JlaXNlYXJ0ZW4vNmMwODZlYmEtNzk3Yi00ZDVjLTk2YTItODhhNGM4OWUyODdlLzM3NjYwMTQ2NjMtMTU2NzQzMzYxMi8xMl9kYW5pZWxfY2FuX2JjLTIwNy5qcGc"
    },
  ];
  ChatScreen(this.user);
  @override
  Widget build(BuildContext context) {
    var blocks = [];
    var tmp = "";

    List<Map<String, String>> block = [];
    for (var msg in thread) {
      if (tmp == msg["who"])
        block.add(msg);
      else {
        tmp = msg["who"];
        if (block.isNotEmpty) blocks.add(block);
        block = [];
        block.add(msg);
      }
    }
    blocks.add(block);

    return Material(
      child: Scaffold(
          appBar: AppBar(
            leadingWidth: 40,
            backgroundColor: GCdarkBlue,
            title: InfoBar(user),
          ),
          body: Column(children: [
            Expanded(
              child: ListView.builder(
                  reverse: true,
                  itemCount: blocks.length,
                  itemBuilder: (c, i) => ChatBlock(user, blocks[i])),
            ),
            TypingBar()
          ])),
    );
  }
}
