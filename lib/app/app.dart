import 'package:get/get.dart';
import 'package:flutter/material.dart';

// Routes
import 'package:chatquick/app/routes/routes.dart';

// Binding
import 'package:chatquick/app/app_binding.dart';

class MyApp extends StatelessWidget {
  
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: AppBinding(),      
      getPages: getPages,
      defaultTransition: Transition.cupertino,
    );
  }

}
