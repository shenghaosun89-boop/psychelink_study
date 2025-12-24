import 'package:flutter/material.dart';
import 'dart:ui';
import '../models/word_model.dart';


class WordsScreen extends StatefulWidget {
  const WordsScreen({super.key});

  @override
  State<WordsScreen> createState() => _WordsScreenState();  
}

class _WordsScreenState extends State<WordsScreen> {
  int _selectedIndex = 0;
  int _selectedWordIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    //根据选择的索引导航到不同的页面
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/favorite');
        break;
      case 2:
        //当前页面无需导航
        break;
      case 3:
        Navigator.pushNamed(context, '/mine');
        break;
    }
  }

  void _onWordButtonTapped(int index) {
    setState(() {
      _selectedWordIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(26, 26, 31, 1),
        leadingWidth: 0,
        leading: Container(),
        titleSpacing: 0,
        title: Container(
          padding: EdgeInsets.only(left: 20),
          alignment: Alignment.topLeft,
          child: Text(
            "Words",
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
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 120,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              _onWordButtonTapped(index);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                                side: BorderSide(
                                  color: index == _selectedWordIndex ?
                                  Color.fromRGBO(wordsList[index].colorList[0], wordsList[index].colorList[1], wordsList[index].colorList[2], 1)
                                  : Colors.white,
                                  width: index == _selectedWordIndex ? 4 : 1,
                                )
                              ),
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.all(0),
                              minimumSize: Size(double.infinity, 0),
                            ),
                            child: SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      wordsList[index].iconPath,
                                    ),
                                    Spacer(),
                                    Text(
                                      wordsList[index].keyWord,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: index == _selectedWordIndex
                                        ? Color.fromRGBO(wordsList[index].colorList[0], wordsList[index].colorList[1], wordsList[index].colorList[2], 1)
                                        : Colors.white,
                                      )
                                    )
                                  ],
                                ),
                              )
                            )
                          )                   
                        );
                      },
                    )
                  ),
                  SizedBox(height: 25),
                  
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [//背景图片卡片
                        Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(wordsList[_selectedWordIndex].backImgPath),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        Positioned(//文案模版卡片
                          top: MediaQuery.of(context).size.height * 0.33,//控制重叠部分的高度
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.90,
                                height: MediaQuery.of(context).size.height * 0.3,
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                    child: Text(
                                      wordsList[_selectedWordIndex].description,
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                    ),
                                  )
                                  
                                ),
                              ),
                            )
                          )
                        )  
                      ],
                    ),
                  )


                ],
              ),
            )
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
