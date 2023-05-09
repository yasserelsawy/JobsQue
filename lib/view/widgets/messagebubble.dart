import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../model/chatmodel.dart';

class MessageBubble extends StatelessWidget {
  final Chat chat;
  const MessageBubble({
    required this.chat,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          chat.id == 0 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: chat.text.length <= 20 ? 40.w : 80.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: chat.id == 0
                  ? const Color(0xFFE5E7EB)
                  : const Color(0xFF3366FF)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  chat.text,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: chat.id == 0
                          ? const Color(0xFF1F2937)
                          : const Color(0xFFF4F4F5)),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      chat.timeStamp,
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: chat.id == 0
                              ? const Color(0xFF6B7280)
                              : const Color(0xFFF4F4F5)),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
