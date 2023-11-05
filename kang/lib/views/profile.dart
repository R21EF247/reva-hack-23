import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  // Function to generate a random username
  String getRandomUsername() {
    const adjectives = ['Cool', 'Mystic', 'Charming', 'Witty', 'Brave'];
    const nouns = ['Explorer', 'Ranger', 'Wizard', 'Knight', 'Traveler'];
    Random random = new Random();
    return '${adjectives[random.nextInt(adjectives.length)]}${nouns[random.nextInt(nouns.length)]}${random.nextInt(100)}';
  }

  @override
  Widget build(BuildContext context) {
    String username =
        getRandomUsername(); // Call function to get a random username

    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                backgroundColor: Theme.of(context).colorScheme.surface,
                child: CircleAvatar(
                  radius: 65,
                  // Use a random image from Google's avatars
                  backgroundImage: NetworkImage(
                      'https://avatars.dicebear.com/api/human/${Random().nextInt(1000).toString()}.png'),
                ),
              ),
              SizedBox(height: 20),
              Text(
                username,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'user@example.com',
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(140),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Your City, Country',
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(140),
                ),
              ),
              // Add more details or styling as needed
            ],
          ),
        ),
      ),
    );
  }
}
