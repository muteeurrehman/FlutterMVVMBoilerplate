import 'package:flutter/material.dart';
import 'package:flutter_app_starter/business_logic/misc/app_colors.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({super.title, super.key})
      : super(
          backgroundColor: AppColors.primaryRed,
        );
}
