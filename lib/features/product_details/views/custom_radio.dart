import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomRadioButton extends StatefulWidget {
  final List<String> radioValues;
  int? initialValue = 0;
  Color selectedTextColor = Colors.white;
  Color unselectedTextColor = Colors.black;
  CustomRadioButton({Key? key, required this.radioValues, this.initialValue})
      : super(key: key);

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.radioValues.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                widget.initialValue = index;
              });
            },
            child: Container(
              width: 35,
              height: 35,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: (widget.initialValue == index)
                    ? Colors.black
                    : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(),
              ),
              child: Text(
                widget.radioValues[index],
                style: TextStyle(
                  color: (widget.initialValue == index)
                      ? widget.selectedTextColor
                      : widget.unselectedTextColor,
                  fontWeight: (widget.initialValue == index)
                      ? FontWeight.bold
                      : FontWeight.w300,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
