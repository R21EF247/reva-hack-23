import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kang/main.dart';
import 'package:kang/router.dart';

@RoutePage()
class MyAppPage extends StatefulWidget {
  @override
  State<MyAppPage> createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [HomeRoute(), ProfileRoute(), SearchRoute()],
      builder: (context, child) {
        final tabRouter = AutoTabsRouter.of(context);
        return Scaffold(
            body: GestureDetector(
              child: child,
              onHorizontalDragEnd: (details) {
                int activeIndex = tabRouter.activeIndex;
                if (details.primaryVelocity != 0) {
                  if (details.primaryVelocity! > 0 && activeIndex > 0) {
                    tabRouter.setActiveIndex(activeIndex - 1);
                  } else if (details.primaryVelocity! < 0 && activeIndex < 2) {
                    tabRouter.setActiveIndex(activeIndex + 1);
                  }
                }
              },
            ),
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: tabRouter.setActiveIndex,
              selectedIndex: tabRouter.activeIndex,
              indicatorColor: Colors.red,
              destinations: [
                NavigationDestination(icon: Icon(Icons.home), label: "home"),
                NavigationDestination(
                    icon: Icon(Icons.search), label: "search"),
                NavigationDestination(
                    icon: Icon(Icons.person_2_outlined), label: "profile"),
              ],
            ));
      },
    );
  }
}
