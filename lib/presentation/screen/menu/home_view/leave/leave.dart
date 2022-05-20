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


class Leave extends StatefulWidget {
  const Leave({Key? key}) : super(key: key);

  @override
  State<Leave> createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  final fromBloc = sl<DateTimePickerBloc>();
  final toBloc = sl<DateTimePickerBloc>();

  ValueNotifier<String> valueNotifier =ValueNotifier('');
  @override
  Widget build(BuildContext context) {

     return Scaffold(
      appBar:const KAppBar(
          title:
          KText(AppString.leaveApplication, color: AppColor.white, fontSize: 28.0)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(

                children: [

                  const SizedBox(height: 46.0),
                  DecoratedDropDown(
                      list: const ['optionOne', 'optionTwo', 'optionThree'],
                      valueNotifier: valueNotifier,
                      hintText: 'Select Category/Type',
                      prefixIcon: const Icon(Icons.category)),
                  const SizedBox(height: 26.0),
                  
                  Row(
                    children: [
                      BlocBuilder<DateTimePickerBloc,DateTimePickerInitial>(
                        bloc: fromBloc,
                        builder: (_,fromState){
                          return  Expanded(child: KDecoratedField(
                              from: true,
                              label: true,
                              value: AppUtility.dateFormat(fromState.dateTime),callback: (){
                            fromBloc.add(PickDate(context: context));
                          },labelString: AppString.from));
                        },
                      ),
                      const SizedBox(width: 18.0),
                      BlocBuilder<DateTimePickerBloc,DateTimePickerInitial>(
                        bloc: toBloc,
                        builder: (_,toState){
                          return  Expanded(child:  KDecoratedField(
                            labelString: AppString.to,
                            label: true,
                            value: AppUtility.dateFormat(toState.dateTime),
                            //from: false,
                            callback: (){
                              toBloc.add(PickDate(context: context));
                            }, from: false,
                          ));
                        },
                      ),
                    ],
                  ),


                  const SizedBox(height: 26.0),
                  const KMultiLineTextField(title: AppString.reason),
                  const SizedBox(height: 35.0),
                  KElevatedButton(string: AppString.save,onTap: (){},width: 90.0),

                ],
              ),
        ),
        ),
      );
  }
}
