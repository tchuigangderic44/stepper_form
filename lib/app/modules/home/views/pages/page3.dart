import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepper_form/app/common/utils/helper.dart';
import 'package:stepper_form/app/common/widgets/custom_text_field.dart';
import 'package:stepper_form/app/modules/home/controllers/home_controller.dart';

class Page3 extends GetView<HomeController> {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController statusMCtrl = TextEditingController();
    TextEditingController numberSCtrl = TextEditingController();
    return Padding(
      padding: EdgeInsets.only(top: 10.hp),
      child: Form(
        key: controller.page3FormKey.value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFormFiels(
              label: 'Profession',
              textEditingController: statusMCtrl,
              hintText: 'Ex: Mobile developper',
              validator: validateString,
            ),
            SizedBox(height: 10.hp,),
            CustomFormFiels(
              label: 'Company',
              textEditingController: numberSCtrl,
              hintText: 'Ex: Google',
              textInputAction: TextInputAction.done,
              validator: validateString,
            ),
          ],
        ),
      ),
    );
  }
}