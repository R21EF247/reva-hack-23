import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kang/widgets/slider.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          backgroundColor: theme.colorScheme.surface,
          title: Text(
            'Good Morning',
            style: theme.textTheme.headlineLarge,
          ),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(
                Icons.person_2_outlined,
                size: 32,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 34),
                  height: size.height * 0.18,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: theme.colorScheme.outlineVariant),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SliderBar(value: '23\u2103', theme: theme),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cyclone,
                            color: theme.colorScheme.onPrimaryContainer,
                            size: 25,
                          ),
                          Text(
                            "2.57 m/s",
                            style: theme.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      SliderBar(
                        theme: theme,
                        value: '50%',
                        currentValue: 50,
                        maxValue: 100,
                        minValue: 0,
                        description: "Hummidity",
                        icon: Icons.water_drop,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
