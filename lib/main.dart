import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// Widgets
import 'package:chatquick/app/app.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]).then((value) => runApp(MyApp() ));

}
