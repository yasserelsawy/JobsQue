import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContainerWidget extends StatefulWidget {
  int index;
  static int? groupValue = 0;
  final ValueChanged<int?>? function;
  final GestureTapCallback? containerFunction;
  ContainerWidget(
      {Key? key,
      required this.index,
      required this.function,
      required this.containerFunction});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.containerFunction,
      child: Container(
        height: 11.h,
        decoration: BoxDecoration(
            color: ContainerWidget.groupValue == widget.index
                ? Color(0xFFD6E4FF)
                : Colors.white,
            border: Border.all(
                color: ContainerWidget.groupValue == widget.index
                    ? Color(0xFF3366FF)
                    : Color(0xFFD1D5DB)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Senior UX Designer - ${widget.index}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'CV.pdf',
                        style: TextStyle(
                            fontSize: 11.sp, color: const Color(0xFF6B7280)),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Icon(
                        Icons.circle,
                        size: 2.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'Portfolio.pdf',
                        style: TextStyle(
                            fontSize: 11.sp, color: const Color(0xFF6B7280)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            Radio(
                toggleable: true,
                value: widget.index,
                groupValue: ContainerWidget.groupValue,
                onChanged: widget.function)
          ],
        ),
      ),
    );
  }
}

// Padding(
//   padding: EdgeInsets.only(right: 12.0),
//   child: Icon(
//     Icons.radio_button_off,
//     size: 4.w,
//   ),
// )
