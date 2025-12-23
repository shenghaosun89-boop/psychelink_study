

import 'package:flutter/material.dart';
import 'dart:ui';

class MineScreen extends StatelessWidget {
  const MineScreen({super.key});

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
          // Positioned(
          //   top: 20,
          //   child: 
            Container(  
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(26, 26, 31, 1),
              ),
              child: Column(
                children: [
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
                  ),
                ],
              ),
            ),
          //),
          
          Positioned(
            bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 16,
                          left: 35,
                          right: 35,
                          bottom: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 3,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/home');      
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/iconTabHomeNol.png",
                                        width: 28,
                                        height: 28,
                                      ),
                                      SizedBox(height:5),
                                      Text(
                                        "Home",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  )
                                ) 
                              ),
                              
                              Expanded(
                                flex: 3,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/favorite');      
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/iconTabFavoritesNol.png",
                                        width: 28,
                                        height: 28,
                                      ),
                                      SizedBox(height:5),
                                      Text(
                                        "Favorites",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ),

                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/iconTabWordsNol.png",
                                      width: 28,
                                      height: 28,
                                    ),
                                    SizedBox(height:5),
                                    Text(
                                      "Words",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/iconTabMineNol.png",
                                      width: 28,
                                      height: 28,
                                    ),
                                    SizedBox(height:5),
                                    Text(
                                      "Mine",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),

                        )
                      ],                     
                    ),
                  ),
                )                 
              ),
          )
        ],
      ),
    );
  }
}
