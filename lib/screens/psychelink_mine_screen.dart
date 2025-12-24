

import 'package:flutter/material.dart';
import 'dart:ui';

class MineScreen extends StatefulWidget {
  const MineScreen({super.key});
  @override
  State<MineScreen> createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 3;
  }

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
              Navigator.pushNamed(context, '/favorite');
              break;
          case 2: // Words
              Navigator.pushNamed(context, '/words');
              break;
          case 3: // Mine
              // 当前页面，无需导航
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
            "Mine",
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
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Image.asset(
                  "assets/images/usefulBanner/touxiang.png",
                  width: 140,
                  height: 140,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 20,
                ),

                Text(
                  "2349343499",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {
                    print("111");
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: const Color.fromRGBO(40, 39 ,44 , 1),
                    padding: EdgeInsets.all(0),
                    minimumSize: Size(double.infinity, 0)
                  ),
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            "Reminder",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Image.asset(
                            'assets/images/iconDetails.png',
                            width: 14,
                            height: 14,
                            fit: BoxFit.fill,
                          ),
                        ],
                      )    ,
                    )                      
                  )
                ),                
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    print("222");
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: const Color.fromRGBO(39, 39, 44, 1),
                    padding: EdgeInsets.all(0),
                    minimumSize: Size(double.infinity, 0)
                  ),
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            "Photo",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Image.asset(
                            'assets/images/iconDetails.png',
                            width: 14,
                            height: 14,
                            fit: BoxFit.fill,
                          ),
                        ],
                      )    ,
                    )   
                  ),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    print("333");
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: const Color.fromRGBO(39, 39, 44, 1),
                    padding: EdgeInsets.all(0),
                    minimumSize: Size(double.infinity, 0)
                  ),
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            "Privacy Policy",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Image.asset(
                            'assets/images/iconDetails.png',
                            width: 14,
                            height: 14,
                            fit: BoxFit.fill,
                          ),
                        ],
                      )    ,
                    )   
                  ),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    print("444");
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: const Color.fromRGBO(39, 39, 44, 1),
                    padding: EdgeInsets.all(0),
                    minimumSize: Size(double.infinity, 0)
                  ),
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            "Term of Use",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Image.asset(
                            'assets/images/iconDetails.png',
                            width: 14,
                            height: 14,
                            fit: BoxFit.fill,
                          ),
                        ],
                      )    ,
                    )   
                  ),
                ),
                SizedBox(height: 20),

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
