import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_local_db/db/db_helper.dart';
import 'package:latihan_local_db/pages/home/binding.dart';
import 'package:latihan_local_db/pages/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      initialBinding: HomeBindings(),
      getPages: [
        GetPage(
            name: "/", page: () => const HomePage(), binding: HomeBindings())
      ],
    );
  }
}
