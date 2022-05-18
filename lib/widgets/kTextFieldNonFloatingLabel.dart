import 'package:flutter/material.dart';
import 'package:megatech/theme/app_color.dart';

class KTextFieldNonFloatingLabel extends StatelessWidget {
  final String? label;
  final String? hintText;
  final IconData? iconData;

  const KTextFieldNonFloatingLabel(
      {Key? key, this.label, this.hintText, this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[350],
            suffixIcon: Icon(iconData,color: Colors.black,),
            iconColor: Colors.grey[350],
            border: InputBorder.none,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: label,
            hintText: hintText,
            labelStyle:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22)
            //border: OutlineInputBorder(),
            //fillColor:
            ),
      ),
    );
  }
}
