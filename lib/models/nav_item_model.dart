import 'package:custom_navbar/models/nav_model.dart';

class NavItemModel {
  final String title;
  final RiveModel rive;

  NavItemModel({required this.title, required this.rive});
}

List<NavItemModel> bottomNavItems = [
  NavItemModel(
    title: "Chat",
    rive: RiveModel(
        src: "assets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
  ),
    NavItemModel(
    title: "Search",
    rive: RiveModel(
        src: "assets/icons.riv",
        artboard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity"),
  ),
    NavItemModel(
    title: "Timer",
    rive: RiveModel(
        src: "assets/icons.riv",
        artboard: "TIMER",
        stateMachineName: "TIMER_Interactivity"),
  ),
    NavItemModel(
    title: "Notification",
    rive: RiveModel(
        src: "assets/icons.riv",
        artboard: "BELL",
        stateMachineName: "BELL_Interactivity"),
  ),
    NavItemModel(
    title: "Profile",
    rive: RiveModel(
        src: "assets/icons.riv",
        artboard: "USER",
        stateMachineName: "USER_Interactivity"),
  ),
];
