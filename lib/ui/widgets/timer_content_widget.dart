import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/bloc/timer_bloc.dart';
import 'package:timer_app/constant/app_color.dart';
import 'package:timer_app/ui/widgets/button_widget.dart';
import 'package:timer_app/ui/widgets/ocean_wave_widget.dart';
import 'package:timer_app/ui/widgets/text_widget.dart';

class TimerContentWidget extends StatelessWidget {
  const TimerContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        int min = (state.timer) ~/ 60;
        int sec = (state.timer) % 60;
        String time =' ${min.toString().padLeft(2,'0')}:${sec.toString().padLeft(2,'0')}';
        return Stack(
          children: [
            OceanWaveWidget(),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(
                    text: time,
                    fontSize: 50,
                    color: AppColor.textColor,
                  ),
                  SizedBox(height: 30),
                  ButtonWidget(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
