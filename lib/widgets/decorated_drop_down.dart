import 'package:flutter/material.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kText.dart';

class DecoratedDropDown extends StatelessWidget {
  final ValueNotifier<String> valueNotifier;
  final List<String> list;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  const DecoratedDropDown(
      {Key? key,
        required this.list,
        required this.valueNotifier,
        this.labelText,
        this.prefixIcon,
        this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: valueNotifier,
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            labelText != null
                ? KText(labelText!,
                color: AppColor.black,
                enumText: EnumText.bold,
                fontSize: 16.0)
                : const SizedBox.shrink(),
            InputDecorator(
              decoration:  InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: prefixIcon,
                // border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide:
                  BorderSide(width: 1, color: Colors.transparent),
                ),
                // focusedBorder:
                // const OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                hintText: hintText,
              ),
              isEmpty: value.isEmpty,
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: value.isEmpty ? null : value,
                    isDense: true,
                    items: list
                        .map((e) => DropdownMenuItem(child: KText(e), value: e))
                        .toList(),
                    onChanged: (val) {
                      valueNotifier.value = val!;
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}