import 'package:flutter/material.dart';
import 'package:stepper_form/app/common/utils/helper.dart';
import 'package:stepper_form/app/common/widgets/custom_text.dart';

class PhoneNumberPrefix extends StatelessWidget {
  const PhoneNumberPrefix({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 62.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 8.hp,
          ),
          GestureDetector(
            onTap: () {},
            child: MyText(
                text: '+237',
                size: 16.s,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 8.hp,
          ),
          Container(
            height: 40.h,
            width: 1,
            margin: EdgeInsets.only(right: 2.hp),
            child: const DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFF414141),
              ),
            ),
          )
        ],
      ),
    );
  }
}