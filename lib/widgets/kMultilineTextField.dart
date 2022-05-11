import 'package:flutter/material.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kText.dart';
class KMultiLineTextField extends StatelessWidget {
  final String title;
  const KMultiLineTextField({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: AppColor.lightBlue)),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Icon(Icons.message_outlined,size: 28),
              const SizedBox(width: 13.0),
              KText(title)
            ],
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 18.0),
              //filled: true,
              //border: const OutlineInputBorder(),
              border: InputBorder.none,
              fillColor: Colors.grey[200],
              hintText: 'message',
            ),
          ),
        ],
      ),
    );
  }
}
