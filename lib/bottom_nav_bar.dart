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
  List<SMIBool> riveIconInputs = [];

  List<StateMachineController?> controllers = [];

  int selcectedIndex = 0;

  List<String> pages = ["Chat","Search","History","Notification","Profile"];

  void animateTheIcon(int index) {
    riveIconInputs[index].change(true);
    Future.delayed(const Duration(seconds: 1), () {
      riveIconInputs[index].change(false);
    });
  }

  @override
  void dispose() {
    for( var controller in controllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(pages[selcectedIndex],style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
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
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomNavItems.length, (index) {
              final riveIcon = bottomNavItems[index].rive;
              return GestureDetector(
                onTap: () {
                  animateTheIcon(index);
                  setState(() {
                    selcectedIndex = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBar(isActive: selcectedIndex == index),
                    SizedBox(
                      height: 36,
                      width: 36,
                      child: Opacity(
                        opacity: selcectedIndex == index ? 1 : .5,
                        child: RiveAnimation.asset(
                          riveIcon.src,
                          artboard: riveIcon.artboard,
                          onInit: (artboard) {
                            StateMachineController? controller =
                                StateMachineController.fromArtboard(
                                    artboard, riveIcon.stateMachineName);
                      
                            artboard.addController(controller!);

                            controllers.add(controller);
                      
                            controller.findInput<bool>('active');
                      
                            riveIconInputs.add(
                                controller.findInput<bool>('active') as SMIBool);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });

final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 2),
      height: 4,
      width: isActive ?  20 : 0,
      decoration: const BoxDecoration(
        color: Color(0xFF81B4FF),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
