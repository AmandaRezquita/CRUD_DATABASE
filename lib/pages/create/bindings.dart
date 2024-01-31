import 'package:crud_batabase/pages/create/controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class CreateBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateController());
  }
}