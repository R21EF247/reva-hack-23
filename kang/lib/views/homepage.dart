import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
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
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: theme.primaryColor),
                child: Row(
                  children: [
                    
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
