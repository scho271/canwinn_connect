import 'package:canwinn_project/View/Splash.dart';
import 'package:canwinn_project/bloc/sliders/sliders_bloc.dart';
import 'package:canwinn_project/block/counter_block.dart';
import 'package:canwinn_project/helper/storage_helper.dart';
import 'package:canwinn_project/res/localizations/language.dart';
import 'package:canwinn_project/res/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'blocks/fetch_servicelist/fetch_services_list_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageHelper.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBlock(),
      child: BlocProvider(
        create: (context) => ServiceListBloc(),
        child: BlocProvider(
          create: (context) => SlidersBloc(),
          child: ScreenUtilInit(
            designSize: const Size(360, 760),
            minTextAdapt: true,
            splitScreenMode: true,
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
              getPages: AppRoutes.openRoutes(),
              translations: Language(),
              locale: const Locale('en', 'US'),
              fallbackLocale: const Locale('en', 'US'),
            ),
          ),
        ),
      ),
    );
  }
}
