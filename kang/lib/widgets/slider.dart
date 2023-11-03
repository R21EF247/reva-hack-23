import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SliderBar extends StatefulWidget {
  SliderBar(
      {super.key,
      required this.theme,
      required this.value,
      this.minValue = 57,
      this.maxValue = 64,
      this.currentValue = 59,
      this.description = '',
      this.icon = Icons.thermostat});

  final ThemeData theme;
  String value, description;
  double minValue, maxValue, currentValue;
  IconData icon;
  @override
  State<SliderBar> createState() => _SliderBarState();
}

class _SliderBarState extends State<SliderBar> {
  @override
  Widget build(BuildContext context) {
    final theme = widget.theme;
    return SleekCircularSlider(
      innerWidget: (percentage) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: theme.colorScheme.onPrimaryContainer,
            ),
            Text(
              widget.value,
              style: theme.textTheme.titleMedium,
            )
          ],
        );
      },
      appearance: CircularSliderAppearance(
          customWidths:
              CustomSliderWidths(progressBarWidth: 10, trackWidth: 10),
          customColors: CustomSliderColors(
              trackColor: theme.primaryColor,
              progressBarColor: theme.colorScheme.primaryContainer),
          size: 98),
      min: widget.minValue,
      max: widget.maxValue,
      initialValue: widget.currentValue,
    );
    ;
  }
}
