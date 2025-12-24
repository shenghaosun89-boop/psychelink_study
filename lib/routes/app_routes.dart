 import 'package:flutter/material.dart';

import '../screens/psychelink_home_screen.dart';
import '../screens/psychelink_favorite_screen.dart';
import '../screens/psychelink_mine_screen.dart';
import '../screens/psychelink_words_screen.dart';
import '../screens/mirror_subscreen.dart';

 class AppRoutes {
  static const String home = '/';
  static const String favorite = '/favorite';
  static const String mine = '/mine';
  static const String words = '/words';
  static const String mirrorSubPage = '/mirror';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
       return MaterialPageRoute(builder: (_) => const HomeScreen());
      case favorite:
       return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case mine:
       return MaterialPageRoute(builder: (_) => const MineScreen());
      case words:
       return MaterialPageRoute(builder: (_) => const WordsScreen());
      case mirrorSubPage:
       final Map<String, dynamic>? arguments = settings.arguments as Map<String, dynamic>?;
       final int themeIndex = arguments?['themeIndex'] ?? 0;
       return MaterialPageRoute(builder: (_) => MirrorSubscreen(themeIndex: themeIndex));
      default:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    }

  }

 }