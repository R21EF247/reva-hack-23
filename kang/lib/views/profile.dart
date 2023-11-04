import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blue Container Example'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
        ),
      ),
    );
  }
}
