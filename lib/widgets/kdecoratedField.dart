import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kText.dart';

class KDecoratedField extends StatelessWidget {
  final bool from;
  final bool label;
  final String? value;
  final VoidCallback? callback;
  const KDecoratedField({Key? key,required this.label,required this.from, this.callback,this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: 320,
        child: InputDecorator(
          decoration: InputDecoration(
            filled: true,
            //hintText: 'hintText',
            fillColor: Colors.grey[200],
            contentPadding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              borderSide:
              BorderSide(width: 1, color: Colors.transparent,style: BorderStyle.none),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              borderSide: BorderSide(width: 1, color: Colors.transparent),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              borderSide: BorderSide(width: 1, color: Colors.transparent),
            ),
          ),
          child: Row(
            children: [
               Expanded(child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   label?KText(from?AppString.from:AppString.to):const SizedBox.shrink(),
                   //KText(label?'13-03-2022':'11:45PM',color: AppColor.grey),
                   KText(value??'Noting Selected',color: AppColor.grey),
                 ],
               )),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:  [
                  InkWell(onTap: callback,child: Icon(label?Icons.calendar_month:Icons.access_time_outlined)),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              )),
            ],
          )
        ),
      ),
    );
  }
}
// SizedBox(
//   width: 320,
//   child: InputDecorator(
//     decoration: InputDecoration(
//       filled: true,
//       hintText: 'hintText',
//       fillColor: Colors.grey[200],
//       contentPadding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),
//       border: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(16.0)),
//         borderSide:
//         BorderSide(width: 1, color: Colors.transparent,style: BorderStyle.none),
//       ),
//       enabledBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(16.0)),
//         borderSide: BorderSide(width: 1, color: Colors.transparent),
//       ),
//       focusedBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(16.0)),
//         borderSide: BorderSide(width: 1, color: Colors.transparent),
//       ),
//     ),
//     child: Column(
//       children: [
//         Row(
//           children: [
//             KText('From:'),
//             Spacer(),
//             Icon(Icons.calendar_month)
//           ],
//         ),
//         Row(
//           children: [
//             KText('13-03-2022',color: AppColor.grey),
//             Spacer(),
//             Icon(Icons.keyboard_arrow_down)
//           ],
//         ),
//
//       ],
//     ),
//   ),
// ),