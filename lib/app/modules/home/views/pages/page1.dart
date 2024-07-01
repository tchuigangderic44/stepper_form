import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepper_form/app/common/utils/helper.dart';
import 'package:stepper_form/app/common/widgets/custom_text_field.dart';
import 'package:stepper_form/app/common/widgets/phone_number_prefix.dart';
import 'package:stepper_form/app/modules/home/controllers/home_controller.dart';

class Page1 extends GetView<HomeController> {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameCtrl = TextEditingController();
    TextEditingController phoneCtrl = TextEditingController();

    return Padding(
      padding: EdgeInsets.only(top: 10.hp),
      child: Form(
        key: controller.page1FormKey.value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFormFiels(
              label: 'Full name',
              textEditingController: nameCtrl,
              hintText: 'Ex: derico tchuigang',
              validator: validateString,
            ),
            SizedBox(height: 10.hp,),
            CustomFormFiels(
              label: 'Phone number',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.phone,
              textEditingController: phoneCtrl,
              prefixWidget: const PhoneNumberPrefix(),
              hintText: 'Ex: 653 03 82 85',
              validator: validatePhoneNumber,
            ),
          ],
        ),
      ),
    );
  }
}