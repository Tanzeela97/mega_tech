import 'package:flutter/material.dart';
import 'package:megatech/widgets/kText.dart';

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: KText('demo View'),
    );
  }
}
