import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megatech/dependency_injection.dart';
import 'package:megatech/presentation/blocs/authentication/sign_in_bloc.dart';
import 'package:megatech/presentation/blocs/session/session_bloc.dart';
import 'package:megatech/widgets/kloading.dart';

import '../../../../../constant/app_string.dart';
import '../../../../../constant/route_string.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../widgets/kAppbar.dart';
import '../../../../../widgets/kText.dart';

class Device extends StatefulWidget {
  const Device({Key? key}) : super(key: key);

  @override
  State<Device> createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  final bloc = sl<SessionBloc>();

  @override
  void initState() {
    bloc.add(const GetSession());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title:
              KText(AppString.device, color: AppColor.white, fontSize: 28.0)),
      body: BlocBuilder<SessionBloc, SessionState>(
        bloc: bloc,
        builder: (_, state) {
          // if (state is SignInLoading) {
          //   return const KLoading();
          // }
          if (state is SessionError) {
            return Center(child: KText(state.message));
          }
          if (state is SessionLoaded) {
            return ListView.builder(
              itemCount: state.sessionModel.vehicles!.length,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(children: [
                  const SizedBox(height: 26.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RouteString.layout);
                    },
                    child: Container(
                      //  padding: const EdgeInsets.symmetric(horizontal:16.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.grey)),
                      child: Column(
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              color: Colors.grey[400]!,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.brightness_1_rounded,
                                  size: 35,
                                ),
                                const SizedBox(width: 10.0),
                                KText(
                                  'SSS 777',
                                  color: Colors.grey[300],
                                  fontSize: 16,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.brightness_1_rounded,
                                  size: 35,
                                ),
                                const SizedBox(width: 10.0),
                                KText(
                                  'Moving',
                                  color: Colors.green[700],
                                  fontSize: 16,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                const KRowText(
                                  option: AppString.driver,
                                  value: 'Sohaib Shah',
                                ),
                                const SizedBox(height: 10.0),
                                KRowText(
                                    option: AppString.date.toUpperCase(),
                                    value: '05-10-22'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const KText(
                                  AppString.currentLocation,
                                  color: AppColor.grey,
                                  fontSize: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    KText(
                                      'Smchs Society Faiyaz Center,Karachi',
                                      color: AppColor.black,
                                      fontSize: 14,
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.brightness_1_rounded,
                                      size: 40,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            );
          }
          return const Center(child: KText('SomeThing Went Wrong'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.add(const GetSession());
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}

class KRowText extends StatelessWidget {
  final String option;
  final String value;

  const KRowText({
    Key? key,
    required this.option,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 20.0),
        KText(
          option,
          color: AppColor.grey,
          fontSize: 16,
        ),
        const SizedBox(width: 140.0),
        KText(
          value,
          color: AppColor.black,
          fontSize: 14,
        ),
      ],
    );
  }
}
