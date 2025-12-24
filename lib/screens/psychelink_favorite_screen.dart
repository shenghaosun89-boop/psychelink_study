

import 'package:flutter/material.dart';
import 'dart:ui';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
      setState(() {
          _selectedIndex = index;
      });

      // 根据选中的索引导航到不同的页面
      switch (index) {
          case 0: // Home
              Navigator.pushNamed(context, '/home');
              break;
          case 1: // Favorites
              // 当前页面，无需导航
              break;
          case 2: // Words
              Navigator.pushNamed(context, '/words');
              break;
          case 3: // Mine
              Navigator.pushNamed(context, '/mine');
              break;
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(26, 26, 31, 1),
        leadingWidth: 0, // 移除leading的宽度
        leading: Container(), // 添加一个空的leading组件
        titleSpacing: 0, // 移除title的默认间距
        title: Container(
          padding: EdgeInsets.only(left: 20),
          alignment: Alignment.topLeft,
          child: Text(
            "Favorites",
            style: TextStyle(
              fontFamily: "AMSTERDAM-SERIF",
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(26, 26, 31, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/imgFavoritesPlaceholder.png",
                  width: 140,
                  height: 140,
                  fit: BoxFit.contain,
                ),
                //SizedBox(height: 10),
                Text(
                  "No favorites for now",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          
          
          Positioned(//底部固定的导航栏
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        currentIndex: _selectedIndex,
                        selectedItemColor: Colors.white,
                        unselectedItemColor: Colors.grey,
                        backgroundColor: Colors.white.withValues(alpha: 0.1),
                        showSelectedLabels: true,
                        showUnselectedLabels: true,
                        elevation: 0,
                        onTap: _onItemTapped,
                        items: [
                            BottomNavigationBarItem(//home
                                icon: Image.asset(
                                "assets/images/iconTabHomeNol.png",
                                width: 24,
                                height: 24,
                                ),
                                activeIcon: Image.asset(
                                "assets/images/iconTabHomeSel.png",
                                width: 24,
                                height: 24,
                                ),
                                label: "Home",
                            ),
                            BottomNavigationBarItem(//favorite
                                icon: Image.asset(
                                "assets/images/iconTabFavoritesNol.png",
                                width: 24,
                                height: 24,
                                ),
                                activeIcon: Image.asset(
                                "assets/images/iconTabFavoritesSel.png",
                                width: 24,
                                height: 24,
                                ),
                                label: "Favorite",
                            ),
                            BottomNavigationBarItem(//words
                                icon: Image.asset(
                                "assets/images/iconTabWordsNol.png",
                                width: 24,
                                height: 24,
                                ),
                                activeIcon: Image.asset(
                                "assets/images/iconTabWordsSel.png",
                                width: 24,
                                height: 24,
                                ),
                                label: "Words",
                            ),
                            BottomNavigationBarItem(//mine
                                icon: Image.asset(
                                "assets/images/iconTabMineNol.png",
                                width: 24,
                                height: 24,
                                ),
                                activeIcon: Image.asset(
                                "assets/images/iconTabMineSel.png",
                                width: 24,
                                height: 24,
                                ),
                                label: "Mine",
                            ),                  
                        ],
                    ),                                   
                )              
            ),
          ) 
        ],
      ),
    );
  }
}
