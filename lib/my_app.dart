import 'package:flutter/material.dart';
import 'package:nomad_hub/feature/explore/provider/filter_provider.dart';
import 'package:provider/provider.dart';


import 'package:nomad_hub/core/utils/app_colors.dart';
import 'package:nomad_hub/feature/activity/provider/activity_provider.dart';
import 'package:nomad_hub/feature/chat_page/provider/chat_provider.dart';
import 'package:nomad_hub/feature/home_page/provider/home_page_provider.dart';
import 'package:nomad_hub/feature/splash_screen/splash_screen.dart';

import 'package:nomad_hub/core/utils/injection_container.dart' as di;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return
         MultiProvider(providers:  [
          ChangeNotifierProvider(create: (_)=> di.sl<HomePageProvider>(),),
          ChangeNotifierProvider(create: (_)=> di.sl<ChatProvider>(),),
          ChangeNotifierProvider(create: (_)=> di.sl<ActivityProvider>()),
          ChangeNotifierProvider(create: (_)=> di.sl<FilterProvider>(),),
         ],
         child:
        MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryColor, brightness: Brightness.light,),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    ),);
    //  );
  }
}
