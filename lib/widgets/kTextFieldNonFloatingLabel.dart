import 'package:flutter/material.dart';
import 'package:megatech/theme/app_color.dart';

import 'kText.dart';

class KTextFieldNonFloatingLabel extends StatelessWidget {
  final String? label;
  final String? hintText;
  final IconData? iconData;
  final bool enable;
  final TextEditingController? controller;

  const KTextFieldNonFloatingLabel(
      {Key? key,
      this.label,
      this.hintText,
      this.iconData,
      this.enable = true,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: TextFormField(
        enabled: enable,
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.textFieldColor,
            suffixIcon: Icon(
              iconData,
              color: Colors.black,
            ),
            iconColor: AppColor.textFieldColor,
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

class KDecoratedDropDown extends StatelessWidget {
  final String? dropDown;
  final List<String> data;
  final String label;

  const KDecoratedDropDown(
      {Key? key,
      required this.data,
      required this.label,
      required this.dropDown})
      : super(key: key);

  // Initial Selected Value

  @override
  Widget build(BuildContext context) {
    // List of items in our dropdown menu
    String dropdownvalue = 'Item 1';
    var items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];
    return ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: KText(label),
        ),
        tileColor: AppColor.textFieldColor,
        subtitle: DropdownButton(
          // Initial Value
          value: dropdownvalue,

          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),

          // Array list of items
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (Object? value) {},
          // After selecting the desired option,it will
          // change button value to selected value
        ));
  }
}
