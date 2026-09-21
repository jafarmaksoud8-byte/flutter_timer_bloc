import 'package:flutter/material.dart';
import 'package:timer_app/constant/app_color.dart';
import 'package:timer_app/ui/widgets/text_widget.dart';
import 'package:timer_app/ui/widgets/timer_content_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        centerTitle: true,
        title: TextWidget(
          text: 'Flutter Timer',
          fontSize: 30,
          color: AppColor.textColor,
        ),
      ),
      body: TimerContentWidget(),
    );
  }
}
