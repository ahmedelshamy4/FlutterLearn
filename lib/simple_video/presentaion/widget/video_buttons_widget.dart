import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/simple_video/domain/entities/video_post.dart';
import 'package:intl/intl.dart';

class VideoButtonsWidget extends StatelessWidget {
  final VideoPostEntity video;

  const VideoButtonsWidget({
    super.key,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _IconButton(
          numerus: video.likes,
          iconData: Icons.favorite,
          iconColor: Colors.red,
        ),
        _IconButton(
          numerus: video.views,
          iconData: Icons.remove_red_eye,
        ),
        const SizedBox(
          height: 20,
        ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _IconButton(
            numerus: 0,
            iconData: Icons.play_circle_outline,
          ),
        )
      ],
    );
  }
}

class _IconButton extends StatelessWidget {
  final int numerus;
  final IconData iconData;
  final Color? color;

  const _IconButton({
    required this.numerus,
    required this.iconData,
    iconColor,
  }) : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: color,
              size: 30,
            )),
        if (numerus > 0) Text(NumeriFormats.convertToNumeri(numerus.toDouble()))
      ],
    );
  }
}

class NumeriFormats {
  static String convertToNumeri(double numerus) {
    return NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
        .format(numerus);
  }
}
