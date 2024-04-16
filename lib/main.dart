import 'package:flutter/material.dart';
import 'package:flutter_app_starter/business_logic/misc/app_colors.dart';
import 'package:flutter_app_starter/business_logic/misc/route_names.dart';
import 'package:flutter_app_starter/business_logic/repositories/api_repository.dart';
import 'package:flutter_app_starter/business_logic/repositories/bird_repository.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'mvvm/app_route_spec.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        Provider<APIRepository>(create: (_) => APIRepositoryProvider.create()),
         // Provider
      Provider<BirdRepository>(
        create: (context) => BirdRepositoryProvider.create(
          apiRepository: context.read<APIRepository>(),
        ),
      ),

      ],
      child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final _router = AppRouter();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter MVVM With Provider',
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          primaryColor: AppColors.primaryRed,
          textTheme: GoogleFonts.poppinsTextTheme()
        ),
        initialRoute: RouteNames.toBirdsList,
        onGenerateRoute: _router.route);
  }
}
