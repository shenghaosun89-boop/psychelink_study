import 'package:flutter/material.dart';
import 'dart:ui';
import '../models/word_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';
import 'dart:convert';


class WordsScreen extends StatefulWidget {
  const WordsScreen({super.key});

  @override
  State<WordsScreen> createState() => _WordsScreenState();  
}

class _WordsScreenState extends State<WordsScreen> {
  int _selectedIndex = 0;
  int _selectedWordIndex = 0;
  String _currentRandomSentence = "";
  List<List<String>> _sentencesList = [];
  

  Future<void> _loadWordsJson() async {
    String jsonString = await rootBundle.loadString('assets/words.json');
    List<dynamic> jsonData = json.decode(jsonString);
    
    // 提取每个关键词的句子列表
    List<List<String>> sentencesList = [];
    for (var wordData in jsonData) {
      List<String> sentences = List<String>.from(wordData['sentences']);
      sentencesList.add(sentences);
    }
    
    setState(() {
      _sentencesList = sentencesList;
      if (_sentencesList.isNotEmpty && _sentencesList[_selectedWordIndex].isNotEmpty) {
        _currentRandomSentence = _getRandomSentence(_selectedWordIndex);
      }
    });
  }

  String _getRandomSentence(int wordIndex) {
    if (_sentencesList.isNotEmpty && 
        wordIndex < _sentencesList.length && 
        _sentencesList[wordIndex].isNotEmpty) {
      int randomIndex = Random().nextInt(_sentencesList[wordIndex].length);
      return _sentencesList[wordIndex][randomIndex];
    }
    return "sentences not found";
  }
  
  // 刷新随机文案
  void _refreshRandomSentence() {
    setState(() {
      _currentRandomSentence = _getRandomSentence(_selectedWordIndex);
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = 2;
    _loadWordsJson();
  }

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
      if (_sentencesList.isNotEmpty) {
        _currentRandomSentence = _getRandomSentence(index);
      }
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
                      itemCount: wordsList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 130,
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
                                  width: index == _selectedWordIndex ? 3 : 1,
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
                                  color: Colors.white.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                        child: Text(
                                          "\"$_currentRandomSentence\"",
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
                                    Positioned(
                                      bottom: 20,
                                      right: 20,
                                      child: GestureDetector(
                                        onTap: _refreshRandomSentence,
                                        child: Image.asset("assets/images/btnRefresh.png"),
                                      )                                     
                                    )
                                  ],
                                ) 
                              ),
                            )
                          )
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.31,
                          left: 20,
                          child: Image.asset("assets/images/imgQuotationMark.png"),
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
