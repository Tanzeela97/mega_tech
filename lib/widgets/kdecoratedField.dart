import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kText.dart';

class KDecoratedField extends StatelessWidget {
  final bool from;
  final bool label;
  final String? value;
  final String labelString;
  final VoidCallback? callback;

  const KDecoratedField({Key? key,
    required this.label,
    required this.from,
    this.callback,
    this.value, required this.labelString})
      : super(key: key);

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
              //errorText:showError?'please select':null,
              fillColor: Colors.grey[200],
              contentPadding:
              const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(
                    width: 1,
                    color: Colors.transparent,
                    style: BorderStyle.none),
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
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(labelString),
                        //KText(label?'13-03-2022':'11:45PM',color: AppColor.grey),
                        KText(value ?? (label ? 'yyyy-mm-dd' : '00:00'),
                            color: AppColor.grey),
                      ],
                    )),
                Expanded(
                    child: InkWell(
                      onTap: callback,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(label
                              ? Icons.calendar_month
                              : Icons.access_time_outlined),
                          const Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    )),
              ],
            )),
      ),
    );
  }
}

class KDecoratedFieldRadio extends StatelessWidget {
  final ValueNotifier<int> radioNotifier;
  final List<String> data;
  final String label;

  const KDecoratedFieldRadio(
      {Key? key, required this.radioNotifier, required this.data, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: KText(label),
        ),
        tileColor: Colors.grey[200],
        subtitle: ValueListenableBuilder<int>(
            valueListenable: radioNotifier,
            builder: (context, value, child) {
              return Row(
                children: <Widget>[
                  for (int i = 0; i < data.length; i++)
                    Row(
                      children: [
                        Radio<int>(
                          value: i,
                          materialTapTargetSize: MaterialTapTargetSize
                              .shrinkWrap,
                          groupValue: radioNotifier.value,
                          activeColor: AppColor.blue,
                          onChanged: (value) {
                            radioNotifier.value = value!;
                          },
                        ),
                        KText(data[i]),
                      ],
                    )
                ],
              );
            }
        ),
      ),
    );
  }
}