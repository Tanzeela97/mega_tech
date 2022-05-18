import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megatech/app_utility/app_utility.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/presentation/blocs/date_time_picker/date_time_picker_bloc.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/decorated_drop_down.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kElevatedButton.dart';
import 'package:megatech/widgets/kMultilineTextField.dart';
import 'package:megatech/widgets/kText.dart';
import 'package:megatech/widgets/kdecoratedField.dart';

import '../../../../../dependency_injection.dart';

class PreInfo extends StatefulWidget {
  const PreInfo({Key? key}) : super(key: key);

  @override
  State<PreInfo> createState() => _PreInfoState();
}

class _PreInfoState extends State<PreInfo> {
  ValueNotifier<String> valueNotifier = ValueNotifier('');
  final fromBloc = injector<DateTimePickerBloc>();
  final toBloc = injector<DateTimePickerBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const KAppBar(
            title: KText(AppString.preInfo,
                color: AppColor.white, fontSize: 28.0)),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              const SizedBox(height: 26.0),
              DecoratedDropDown(
                  list: const ['optionOne', 'optionTwo', 'optionThree'],
                  valueNotifier: valueNotifier,
                  hintText: 'Select Category/Type',
                  prefixIcon: const Icon(Icons.category)),
              Row(
                children: [
                  BlocBuilder<DateTimePickerBloc, DateTimePickerInitial>(
                    bloc: fromBloc,
                    builder: (_, fromState) {
                      return  Expanded(
                          child: KDecoratedField(
                              value: AppUtility.dateFormat(fromState.dateTime),
                            callback: (){
                              fromBloc.add(PickDate(context: context));
                            },
                              label: true,
                              from: false,
                              labelString: AppString.from));
                    },
                  ),
                  const SizedBox(width: 18.0),
                  BlocBuilder<DateTimePickerBloc, DateTimePickerInitial>(
                    bloc: fromBloc,
                    builder: (_, toState) {
                      return   Expanded(
                        child: KDecoratedField(
                          labelString: '',
                          from: true,
                          label: false,
                          value: AppUtility.timeFormat(toState.timeOfDay),
                          callback: () {
                            fromBloc.add(PickTime(context: context));
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              Row(
                children:  [
                  BlocBuilder<DateTimePickerBloc, DateTimePickerInitial>(
                    bloc: toBloc,
                    builder: (_, toState) {
                      return  Expanded(
                          child: KDecoratedField(
                              value: AppUtility.dateFormat(toState.dateTime),
                              callback: (){
                                toBloc.add(PickDate(context: context));
                              },
                              label: true,
                              from: false,
                              labelString: AppString.to));
                    },
                  ),
                  const SizedBox(width: 18.0),
                  BlocBuilder<DateTimePickerBloc, DateTimePickerInitial>(
                    bloc: toBloc,
                    builder: (_, toState) {
                      return   Expanded(
                        child: KDecoratedField(
                          labelString: '',
                          from: true,
                          label: false,
                          value: AppUtility.timeFormat(toState.timeOfDay),
                          callback: () {
                            toBloc.add(PickTime(context: context));
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              const KMultiLineTextField(title: AppString.infoRemarks),
              const SizedBox(height: 26.0),
              KElevatedButton(
                  string: AppString.save, onTap: () {}, width: 90.0),
            ])));
  }
}
