import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class KTextFieldRadioButton extends StatefulWidget {
  final String? label;

  const KTextFieldRadioButton({
    Key? key,
    this.label,
  }) : super(key: key);

  @override
  State<KTextFieldRadioButton> createState() => _KTextFieldRadioButtonState();
}

class _KTextFieldRadioButtonState extends State<KTextFieldRadioButton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color:  Colors.grey[350]!,
            borderRadius: BorderRadius.circular(8.0),
           ),

        child: Column(children: [
          TextField(
            decoration: InputDecoration(
                filled: true,

                border: InputBorder.none,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                  //labelText: label,
                //  hintText: hintText,
                labelStyle:
                    Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22)
                //border: OutlineInputBorder(),
                //fillColor:
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Radio(value: "male", groupValue: 1, onChanged: (onChanged) {}),
              const Text("Yes"),
              Radio(value: "gender", groupValue: 1, onChanged: (onChanged) {}),
                const Text("No"),
           ],
          )
        ]),
      ),
    );
  }
}
