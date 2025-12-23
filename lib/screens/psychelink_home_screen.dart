
import 'package:flutter/material.dart';
import 'dart:ui';

class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [                                    
                                        ElevatedButton(//按钮1
                                            onPressed: () {
                                                print("111");
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(28)                                               
                                                ),
                                                padding: EdgeInsets.all(0),
                                                minimumSize: Size(double.infinity,0)//按钮宽度占满父组件
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
                                                                        image: AssetImage('assets/images/usefulBanner/imgMirrorCover@2x.png'),
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
                                                                "Mirror",
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
                                                                "6 Affirmations",
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    color: Colors.grey
                                                                ),
                                                            ), 
                                                        )
                                                    ],
                                                ),
                                                
                                            ),
                                        ),
                                        SizedBox(height: 12),

                                        ElevatedButton(//按钮2
                                            onPressed: () {
                                                print("222");
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(28)                                               
                                                ),
                                                padding: EdgeInsets.all(0),
                                                minimumSize: Size(double.infinity,0)//按钮宽度占满父组件
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
                                                                        image: AssetImage('assets/images/usefulBanner/imgLotusCover@2x.png'),
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
                                                                "Lotus",
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
                                                                "5 Affirmations",
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    color: Colors.grey
                                                                ),
                                                            ), 
                                                        )
                                                    ],
                                                ),
                                                
                                            ),
                                        ),
                                        SizedBox(height: 12),

                                        ElevatedButton(//按钮3
                                            onPressed: () {
                                                print("333");
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(28)                                               
                                                ),
                                                padding: EdgeInsets.all(0),
                                                minimumSize: Size(double.infinity,0)//按钮宽度占满父组件
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
                                                                        image: AssetImage('assets/images/usefulBanner/imgBubblesCover@2x.png'),
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
                                                                "Bubbles",
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
                                                                "5 Affirmations",
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    color: Colors.grey
                                                                ),
                                                            ), 
                                                        )
                                                    ],
                                                ),
                                                
                                            ),
                                        ),
                                        SizedBox(height: 12),

                                        ElevatedButton(//按钮4
                                            onPressed: () {
                                                print("444");
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(28)                                               
                                                ),
                                                padding: EdgeInsets.all(0),
                                                minimumSize: Size(double.infinity,0)//按钮宽度占满父组件
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
                                                                        image: AssetImage('assets/images/usefulBanner/imgSpringCover@2x.png'),
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
                                                                "Spring",
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
                                                                "4 Affirmations",
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    color: Colors.grey
                                                                ),
                                                            ), 
                                                        )
                                                    ],
                                                ),
                                                
                                            ),
                                        ),
                                        SizedBox(height: 12),

                                        ElevatedButton(//按钮5
                                            onPressed: () {
                                                print("555");
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(28)                                               
                                                ),
                                                padding: EdgeInsets.all(0),
                                                minimumSize: Size(double.infinity,0)//按钮宽度占满父组件
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
                                                                        image: AssetImage('assets/images/usefulBanner/imgAppleCover@2x.png'),
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
                                                                "Apple",
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
                                                                "4 Affirmations",
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    color: Colors.grey
                                                                ),
                                                            ), 
                                                        )
                                                    ],
                                                ),
                                                
                                            ),
                                        ),
                                        SizedBox(height: 12),

                                        ElevatedButton(//按钮6
                                            onPressed: () {
                                                print("666");
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(28)                                               
                                                ),
                                                padding: EdgeInsets.all(0),
                                                minimumSize: Size(double.infinity,0)//按钮宽度占满父组件
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
                                                                        image: AssetImage('assets/images/usefulBanner/imgFlowerCover@2x.png'),
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
                                                                "Flower",
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
                                                                "5 Affirmations",
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    color: Colors.grey
                                                                ),
                                                            ), 
                                                        )
                                                    ],
                                                ),
                                                
                                            ),
                                        ),
                                        SizedBox(height: 12),
                                        SizedBox(height: 100),                                                                                                   
                                    ],
                                )
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
                                  child: 
                                   Column(
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
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/mine');      
                                    },
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
            ]
          )  
        );
    }

}