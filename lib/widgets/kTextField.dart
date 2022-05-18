import 'package:flutter/material.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kText.dart';

import '../constant/app_string.dart';

class KTextField extends StatelessWidget {
  final String label;
  final String? hintText;

  final TextEditingController? controller;
  const KTextField(
      {Key? key, required this.label, this.controller, this.hintText,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: 320,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.only(left: 12),
                child: KText(label, fontSize: 18.0, color: AppColor.grey)),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                hintText: hintText,
                fillColor: Colors.grey[200],
                // border: const OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(16.0)),
                //   borderSide:
                //   BorderSide(width: 1, color: Colors.transparent,style: BorderStyle.none),
                // ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  borderSide: BorderSide(width: 1, color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    borderSide:
                        BorderSide(width: 1, color: Colors.transparent)),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}

