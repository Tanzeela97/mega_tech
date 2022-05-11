import 'package:flutter/material.dart';
import 'package:megatech/dependency_injection.dart' as di;
import 'package:megatech/my_app.dart';

void main() {
  di.init();
  runApp(const MyApp());
}