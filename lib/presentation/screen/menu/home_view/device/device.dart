import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constant/app_string.dart';
import '../../../../../theme/app_color.dart';
import '../../../../../widgets/kAppbar.dart';
import '../../../../../widgets/kText.dart';


class Device extends StatelessWidget {
  const Device({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const  KAppBar(
          title:
              KText(AppString.device, color: AppColor.white, fontSize: 28.0)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(children: [
          const SizedBox(height: 26.0),
          Container(
            //  padding: const EdgeInsets.symmetric(horizontal:16.0),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey)),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10) ),
                    color: Colors.grey[400]!,
                  ),
                  child: Row(
                    children:  [
                      const Icon(
                        Icons.brightness_1_rounded,
                        size: 35,
                      ),
                      const SizedBox(width: 10.0),
                      KText('SSS 777',color: Colors.grey[300],fontSize: 16,),
                      const Spacer(),
                      const Icon(
                        Icons.brightness_1_rounded,
                        size: 35,
                      ),
                      const SizedBox(width: 10.0),
                      KText('Moving',color: Colors.green[700],fontSize: 16,),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(

                    children:  [
                      const  KRowText(
                        option: AppString.driver,
                        value: 'Sohaib Shah',
                      ),
                      const  SizedBox(height: 10.0),
                      KRowText(option: AppString.date.toUpperCase(), value: '05-10-22'),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),

                Padding(
                  padding:  const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const KText(AppString.currentLocation,color: AppColor.grey,fontSize: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [

                          KText('Smchs Society Faiyaz Center,Karachi',color: AppColor.black,fontSize: 14,),
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
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
        KText(option,color: AppColor.grey,fontSize: 16,),
        const SizedBox(width: 140.0),
        KText(value,color: AppColor.black,fontSize: 14,),
      ],
    );
  }
}
