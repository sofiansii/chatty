import 'package:chatty/pages/common/colors.dart';
import 'package:flutter/material.dart';

class TypingBar extends StatefulWidget {
  @override
  _TypingBarState createState() => _TypingBarState();
}

class _TypingBarState extends State<TypingBar> {
  TextEditingController _controller = TextEditingController();

  bool _typing = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4).copyWith(bottom: 5),
            child: ClipOval(
              child: Material(
                color: GCpink,
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                        child: Icon(Icons.add, color: GCdarkBlue, size: 22)),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                onChanged: (s) =>
                    setState(() => _typing = s.isEmpty ? false : true),
                maxLines: 4,
                minLines: 1,
                textInputAction: TextInputAction.newline,
                controller: _controller,
                decoration: InputDecoration(
                    hintText: "Write a message", border: InputBorder.none),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(4.0).copyWith(bottom: 5),
              child: SizedBox(
                  child: Icon(Icons.emoji_emotions_outlined,
                      color: GCgrey, size: 27)),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0).copyWith(bottom: 5),
              child: SizedBox(
                  child: Icon(Icons.arrow_right_alt_outlined,
                      color: _typing ? Colors.black : GCgrey, size: 27)),
            ),
          ),
        ],
      ),
    );
  }
}
