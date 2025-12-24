
import 'package:flutter/material.dart';
import 'dart:ui';
import '../models/theme_model.dart';

class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});
    @override
    State<HomeScreen> createState() => _PsychelinkHomeScreenState();
}

class _PsychelinkHomeScreenState extends State<HomeScreen> {
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
        setState(() {
            _selectedIndex = index;
        });

        // 根据选中的索引导航到不同的页面
        switch (index) {
            case 0: // Home
                // 当前页面，无需导航
                break;
            case 1: // Favorites
                Navigator.pushNamed(context, '/favorite');
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
            backgroundColor: const Color.fromRGBO(26, 26 , 31, 1),
            leadingWidth: 0, // 移除leading的宽度
            leading: Container(), // 添加一个空的leading组件
            titleSpacing: 0, // 移除title的默认间距
            title: Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: Column(    
                    crossAxisAlignment: CrossAxisAlignment.start,                
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                        Text(
                            "Posiflow",
                            style: TextStyle(
                                fontFamily: 'AMSTERDAM-SERIF',
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        
                        Text(
                            "choose a theme blow to start",
                            style: TextStyle(
                                fontFamily: 'AMSTERDAM-SERIF',
                                color: Colors.grey,
                                fontSize: 18,
                            ),
                        )
                    ],
                ),
            ) 
        ),
        body: Stack(
              children: [
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(26, 26, 31, 1)
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        child: Column(
                          children: [
                            ...themeList.asMap().entries.map((entry) {
                              int index = entry.key;
                              ThemeModel theme = entry.value;
                              return Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/mirror',arguments: {'themeIndex': index});
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(28)
                                      ),
                                      padding: EdgeInsets.all(0),
                                      minimumSize: Size(double.infinity,0),
                                    ),
                                    child: SizedBox(
                                      height: 140,
                                      width: double.infinity,
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(28),
                                            child: Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(theme.buttonImage),
                                                  fit: BoxFit.fill,
                                                  alignment: Alignment.topCenter,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 20,
                                            top: 13,
                                            child: Text(
                                              theme.keyWord,
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),  
                                            ),
                                          ),
                                          Positioned(
                                            left: 20,
                                            top: 43,
                                            child: Text(
                                              "Direction of the mind",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 20,
                                            bottom: 15,
                                            child: Text(
                                              "${theme.steps} Affirmations",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            ),                                            
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12)
                                ],
                              );
                            }),
                            SizedBox(height: 100)
                          ],
                        ),                                       
                      )
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
            ]
          ),          
      );
    }

}