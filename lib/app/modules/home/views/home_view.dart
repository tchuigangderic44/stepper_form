import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stepper_form/app/common/utils/helper.dart';
import 'package:stepper_form/app/common/widgets/custom_boutton.dart';
import 'package:stepper_form/app/modules/home/controllers/home_controller.dart';
import 'package:stepper_form/app/modules/home/views/pages/page1.dart';
import 'package:stepper_form/app/modules/home/views/pages/page2.dart';
import 'package:stepper_form/app/modules/home/views/pages/page3.dart';
import 'package:stepper_form/app/modules/home/widgets/progress.dart';

import '../../../common/widgets/custom_text.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progressive form'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.only(left: 15.hp, right: 15.hp, top: 40.vp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressForm(
                controller: controller.pFormController,
                pages: const [
                  Page1(),
                  Page2(),
                  Page3(),
                ], 
                titles: const [
                  ProgressTitle(title: 'Personnal information',),
                  ProgressTitle(title: 'Location details',),
                  ProgressTitle(title: 'Professional information',),
                ]
              )
            ],
          )
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 10.hp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              int pageIndex = controller.pageIndex.value;
              return pageIndex != 0
              ? MyButton(
                title: 'Previous', 
                width: 150,
                btnColor: Colors.grey,
                onTap: () {
                  controller.toPrevouisPage();
                }
              ) : const SizedBox();
            }
            ),
            SizedBox(width: 10.hp),
            MySecondButton(
              title: Obx(() {
                int pageIndex = controller.pageIndex.value;
                return Center(child: MyText(
                  text: pageIndex !=2
                  ? 'Next' : 'Submit', 
                  size: 16, 
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  ),
                );
              }), 
              width: 150,
              onTap: () {
                int pageIndex = controller.pageIndex.value;
                if (pageIndex == 0) {
                  controller.submitPage1();
                }
                if (pageIndex == 1) {
                  controller.submitPage2();
                }
                if (pageIndex == 2) {
                  controller.submitPage3();
                }
              }
            )
          ],
        ),
      ),
    );
  }
}
