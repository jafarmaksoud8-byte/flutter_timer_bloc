import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/bloc/timer_bloc.dart';
import 'package:timer_app/constant/app_color.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is TimerInitialState)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.buttonColor,
                  shape: CircleBorder(),
                  minimumSize: Size(60, 60),
                ),
                onPressed: () {
                  context.read<TimerBloc>().add(PlayEvent());
                },
                child: Icon(
                  Icons.play_arrow,
                  size: 30,
                  color: AppColor.iconColor,
                ),
              ),
            if (state is TimerRunningState)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.buttonColor,
                  shape: CircleBorder(),
                  minimumSize: Size(60, 60),
                ),
                onPressed: () {
                  context.read<TimerBloc>().add(PauseEvent());
                },
                child: Icon(Icons.pause, size: 30, color: AppColor.iconColor),
              ),
            if (state is TimerPausedState)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.buttonColor,
                  shape: CircleBorder(),
                  minimumSize: Size(60, 60),
                ),
                onPressed: () {
                  context.read<TimerBloc>().add(ResumeEvent());
                },
                child: Icon(
                  Icons.play_arrow,
                  size: 30,
                  color: AppColor.iconColor,
                ),
              ),

            if (state is TimerRunningState || state is TimerPausedState)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.buttonColor,
                  shape: CircleBorder(),
                  minimumSize: Size(60, 60),
                ),
                onPressed: () {
                  context.read<TimerBloc>().add(ResetEvent());
                },
                child: Icon(
                  Icons.restart_alt,
                  size: 30,
                  color: AppColor.iconColor,
                ),
              ),
          ],
        );
      },
    );
  }
}
