import 'package:custom_navbar/models/nav_item_model.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

const Color bottomNavBgColor = Color(0xFF17203A);

class BottomNavigationBarwithAnimation extends StatefulWidget {
  const BottomNavigationBarwithAnimation({super.key});

  @override
  State<BottomNavigationBarwithAnimation> createState() =>
      _BottomNavigationBarwithAnimationState();
}

class _BottomNavigationBarwithAnimationState
    extends State<BottomNavigationBarwithAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: 
       SafeArea(
         child: Container(
           
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
          decoration: BoxDecoration(
              color: bottomNavBgColor.withOpacity(0.8),
              borderRadius: const BorderRadius.all(
                Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                    color: bottomNavBgColor.withOpacity(0.3),
                    offset: const Offset(0, 20),
                    blurRadius: 20,
                    )
             ]
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                bottomNavItems.length,
                (index) => SizedBox(
                      height: 36,
                      width: 36,
                      child: RiveAnimation.asset(
                        bottomNavItems[index].rive.src,
                        artboard: bottomNavItems[index].rive.artboard,
                      ),
                    )),
          ),
             ),
       ),
    );
  }
}
