import 'package:flutter/material.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/constant/route_string.dart';
import 'package:megatech/widgets/kElevatedButton.dart';
import 'package:megatech/widgets/kText.dart';
import 'package:megatech/widgets/kTextField.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 500),
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (_, value, child) {
                  return Padding(
                    padding: EdgeInsets.only(top: 150 * value),
                    child: Opacity(opacity: value, child: child),
                  );
                },
                child: const SizedBox(
                    height: 150,

                    child: Image(image: ImageString.logo))),
            const KText(AppString.enterUsernameAndPassword,
                textAlign: TextAlign.center,
                fontSize: 22,
                enumText: EnumText.bold),
            const SizedBox(height: 52.0),
             const KTextField(label: AppString.userName,
               ),
            const SizedBox(height: 10.0),
            const KTextField(label: AppString.password),
            const SizedBox(height: 45.0),
            KElevatedButton(string: AppString.signIn,onTap: (){
              Navigator.pushReplacementNamed(context, RouteString.layout);

            }),

          ],
        ),
      ),
    );
  }
}


