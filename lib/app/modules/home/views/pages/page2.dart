import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepper_form/app/common/utils/helper.dart';
import 'package:stepper_form/app/common/widgets/custom_text_field.dart';
import 'package:stepper_form/app/modules/home/controllers/home_controller.dart';

class Page2 extends GetView<HomeController> {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController addressCtrl = TextEditingController();
    TextEditingController cityCtrl = TextEditingController();
    return Padding(
      padding: EdgeInsets.only(top: 10.hp),
      child: Form(
        key: controller.page2FormKey.value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFormFiels(
              label: 'City',
              textEditingController: cityCtrl,
              hintText: 'Ex: Douala',
              validator: validateString,
            ),
            SizedBox(height: 10.hp,),
            CustomFormFiels(
              label: 'Address',
              textEditingController: addressCtrl,
              hintText: 'Ex: 1200 deido Chales eyoun',
              textInputAction: TextInputAction.done,
              validator: validateString,
            )
          ],
        ),
      ),
    );
  }
}