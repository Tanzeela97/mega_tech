import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/constant/image_string.dart';
import 'package:megatech/constant/route_string.dart';
import 'package:megatech/dependency_injection.dart';
import 'package:megatech/presentation/blocs/authentication/sign_in_bloc.dart';
import 'package:megatech/source/data_source/local_data_source.dart';
import 'package:megatech/source/data_source/remote_data_source.dart';
import 'package:megatech/source/repository/sign_in_repository.dart';
import 'package:megatech/widgets/kElevatedButton.dart';
import 'package:megatech/widgets/kText.dart';
import 'package:megatech/widgets/kTextField.dart';
import 'package:megatech/widgets/kloading.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final bloc = sl<SignInBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 150),
              const SizedBox(
                  height: 150, child: Image(image: ImageString.logo)),
              const KText(AppString.enterUsernameAndPassword,
                  textAlign: TextAlign.center,
                  fontSize: 22,
                  enumText: EnumText.bold),
              const SizedBox(height: 52.0),
              const KTextField(label: AppString.userName),
              const SizedBox(height: 10.0),
              const KTextField(label: AppString.password),
              const SizedBox(height: 45.0),
              BlocConsumer<SignInBloc, SignInState>(
                bloc: bloc,
                builder: (_, state) {
                  if(state is SignInLoading) {
                    return const KLoading();
                  }
                  return KElevatedButton(
                      string: AppString.signIn,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          bloc.add(const GetLogin(name: 'name', password: 'password'));
                        }
                        // Navigator.pushReplacementNamed(context, RouteString.device);
                      });
                },
                listener: (_, state) {
                  Navigator.pushReplacementNamed(context, RouteString.device);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
