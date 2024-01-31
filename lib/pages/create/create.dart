import 'package:crud_batabase/pages/create/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePage extends GetView<CreateController> {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add note"),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller.titleController,
            decoration: InputDecoration(
              labelText: "Title",
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: controller.contentController,
            decoration: InputDecoration(
              labelText: "Content",
              border: OutlineInputBorder(),
            ),
          ),
          Spacer(),
          ElevatedButton(onPressed: controller.onSubmit, child: Text("Submit"))
        ],
      ),
    );
  }
}
