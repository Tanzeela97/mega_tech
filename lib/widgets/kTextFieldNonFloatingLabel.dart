import 'package:flutter/material.dart';

class KTextFieldNonFloatingLabel extends StatelessWidget {
  final String? label;
  final String? hintText;
  const KTextFieldNonFloatingLabel({Key? key,this.label, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            //fillColor: Colors.grey[200],
            // border: const OutlineInputBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(16.0)),
            //   borderSide:BorderSide.none
            //
            // ),
            border: InputBorder.none,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: label,
            hintText: hintText,
            labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22),
          //border: OutlineInputBorder(),
          //fillColor:
        ),
      ),
    );
  }
}