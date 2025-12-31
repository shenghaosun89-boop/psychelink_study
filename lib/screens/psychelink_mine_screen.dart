

import 'package:flutter/material.dart';
import 'dart:ui';

class MineScreen extends StatefulWidget {
  const MineScreen({super.key});
  @override
  State<MineScreen> createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> {

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        ],
    );
  }
}
