import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megatech/constant/app_string.dart';
import 'package:megatech/theme/app_color.dart';
import 'package:megatech/widgets/kAppbar.dart';
import 'package:megatech/widgets/kElevatedButton.dart';
import 'package:megatech/widgets/kText.dart';
import 'package:megatech/widgets/kdecoratedField.dart';

import '../../../../../app_utility/app_utility.dart';
import '../../../../../dependency_injection.dart';
import '../../../../blocs/date_time_picker/date_time_picker_bloc.dart';

class AppliedLeave extends StatelessWidget {
  final fromBloc = injector<DateTimePickerBloc>();
  final toBloc = injector<DateTimePickerBloc>();

  AppliedLeave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
          title: KText(AppString.appliedLeave,
              color: AppColor.white, fontSize: 28.0)),
      body: SingleChildScrollView(
        child: BlocBuilder<DateTimePickerBloc, DateTimePickerInitial>(
            bloc: fromBloc,
            builder: (_, fromState) {
              return BlocBuilder<DateTimePickerBloc, DateTimePickerInitial>(
                  bloc: toBloc,
                  builder: (_, toState) {
                    return Center(
                      child: Column(children: [
                        const SizedBox(height: 170.0),
                        // const SizedBox(height: 36.0),
                        // const SizedBox(
                        //   height: 150,
                        //   width: 150,
                        //   child: Image(
                        //     image: ImageString.fuelGauge,
                        //   ),
                        // ),
                        // const SizedBox(height: 18.0),
                        // const KText('4.5Ltr', fontSize: 35),
                        // const KText('14 March 2022,11:45PM'),
                        // const SizedBox(height: 18.0),



                        KDecoratedField(
                          label: true,
                          from: true,
                          labelString: AppString.from,
                          value: AppUtility.dateFormat(fromState.dateTime),
                          callback: () {
                            fromBloc.add(PickDate(context: context));
                          },
                        ),
                        KDecoratedField(
                          labelString: '',
                          from: true,
                          label: false,
                          value: AppUtility.timeFormat(toState.timeOfDay),
                          callback: () {
                            toBloc.add(PickTime(context: context));
                          },
                        ),
                        KDecoratedField(
                            label: true, from: true, labelString: AppString.to,
                          value: AppUtility.dateFormat(toState.dateTime),
                          callback: () {
                            toBloc.add(PickDate(context: context));
                          },
                        ),
                        KDecoratedField(
                          labelString: '',
                          from: true,
                          label: false,
                          value: AppUtility.timeFormat(toState.timeOfDay),
                          callback: () {
                            toBloc.add(PickTime(context: context));
                          },
                        ),
                        const SizedBox(height: 26),
                        KElevatedButton(
                            width: 130, string: AppString.show, onTap: () {}),
                      ]),
                    );
                  });
            }),
      ),
    );
  }
}
