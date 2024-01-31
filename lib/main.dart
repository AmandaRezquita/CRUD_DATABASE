import 'package:crud_batabase/pages/create/bindings.dart';
import 'package:crud_batabase/pages/create/create.dart';
import 'package:crud_batabase/pages/home/bindings.dart';
import 'package:crud_batabase/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'db/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: "/",
        initialBinding: HomeBinding(),
        getPages: [
          GetPage(
              name: "/", page: () => const HomePage(), binding: HomeBinding()),
          GetPage(
              name: "/create",
              page: () => const CreatePage(),
              binding: CreateBindings())
        ]);
  }
}
