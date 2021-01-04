import 'package:get/get.dart';

// Pages
import 'package:chatquick/app/modules/home/chat/chat_page.dart';
import 'package:chatquick/app/modules/main/login/login_page.dart';
import 'package:chatquick/app/modules/main/splash/splash_page.dart';
import 'package:chatquick/app/modules/main/register/register_page.dart';
import 'package:chatquick/app/modules/home/details.dart/details_page.dart';

// Bindings
import 'package:chatquick/app/modules/home/chat/chat_binding.dart';
import 'package:chatquick/app/modules/main/login/login_binding.dart';
import 'package:chatquick/app/modules/main/splash/splahs_binding.dart';
import 'package:chatquick/app/modules/main/register/register_binding.dart';
import 'package:chatquick/app/modules/home/details.dart/details_binding.dart';

List<GetPage> getPages = [
  GetPage(
    name: '/',
    page: () => SplashPage(),
    binding: SplahsBinding()
  ),
  GetPage(
    name: '/login',
    page: () => LoginPage(),
    binding: LoginBinding()
  ),
  GetPage(
    name: '/register',
    page: () => RegsiterPage(),
    binding: RegisterBinding()
  ),
  GetPage(
    name: '/chat',
    page: () => ChatPage(),
    binding: ChatBinding()
  ),
  GetPage(
    name: '/chatDetails',
    page: () => DetailsPage(),
    binding: DetailsBinding()
  ),
];