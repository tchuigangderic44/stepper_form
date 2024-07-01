import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stepper_form/app/modules/home/widgets/progress.dart';

class HomeController extends GetxController {
  final page1FormKey = GlobalKey<FormState>().obs;
  final page2FormKey = GlobalKey<FormState>().obs;
  final page3FormKey = GlobalKey<FormState>().obs;
  RxInt pageIndex = RxInt(0);
  PFormController? pFormController = PFormController(length: 3);

  void toNextPage() {
    pFormController!.nextPage();
    if (pageIndex.value < pFormController!.length - 1) {
      pageIndex.value = pageIndex.value + 1;
    }
  }
  void toPrevouisPage() {
    pFormController!.prevPage();
    if (pageIndex.value > 0) {
      pageIndex.value = pageIndex.value - 1;
    }
  }
  submitPage1() {
    if (page1FormKey.value.currentState!.validate() == true) {
      toNextPage();
    } else {
      return;
    }
  }
  submitPage2() {
    if (page2FormKey.value.currentState!.validate() == true) {
      toNextPage();
    } else {
      return;
    }
  }
  submitPage3() {
    if (page3FormKey.value.currentState!.validate() == true) {
      toNextPage();
    } else {
      return;
    }
  }
  // @override
  // void onClose() {
  //   pFormController!.dispose();
  //   super.onClose();
  // }
}
