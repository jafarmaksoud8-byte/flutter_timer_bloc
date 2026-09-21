import 'package:flutter/material.dart';
import 'package:timer_app/constant/app_color.dart';
import 'package:wave/wave.dart';

class OceanWaveWidget extends StatelessWidget {
  const OceanWaveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      config: CustomConfig(
        gradients: [AppColor.waveGradient1, AppColor.waveGradient2],
        durations: [1800, 3000],
        heightPercentages: [0.0, 0.1],
        blur: MaskFilter.blur(BlurStyle.solid, 10),
      ),
      size: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
    );
  }
}
