import 'package:flutter/material.dart';
import 'package:version_3_22_8/features/attaches/presentation/destination.dart';
import 'package:version_3_22_8/features/attaches/presentation/pages/animations.dart';
import 'package:version_3_22_8/features/attaches/presentation/pages/widgets/animated_floating_action_button.dart';
import 'package:version_3_22_8/features/attaches/presentation/transitions/nav_rail_transistions.dart';

class DisappearingNavigationRail extends StatelessWidget {
  const DisappearingNavigationRail({
    super.key,
    required this.backgroundColor,
    required this.selectedIndex,
    this.onDestinationSelected,
     required this.railAnimation,                      
    required this.railFabAnimation,  
  });

  final Color backgroundColor;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  final RailAnimation railAnimation;
  final RailFabAnimation railFabAnimation;

  @override
  Widget build(BuildContext context) {
    return NavRailTransition(
      animation: railAnimation,
      backgroundColor: backgroundColor,
      child: NavigationRail(
        selectedIndex: selectedIndex,
        backgroundColor: backgroundColor,
        onDestinationSelected: onDestinationSelected,
        leading: Column(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            const SizedBox(height: 8),
            AnimatedFloatingActionButton(
              animation: railFabAnimation,
              elevation: 0,
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ],
        ),
        groupAlignment: -0.85,
        destinations: destinations.map((d) {
          return NavigationRailDestination(
            icon: Icon(d.icon),
            label: Text(d.label),
          );
        }).toList(),
      ),
    );
  }
}
