
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: const Color.fromRGBO(26, 26 , 31, 1),
                
                title: Container(
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
            body:  Stack(
                    children: [
                        Container(//背景色
                            width: double.infinity,
                            height: double.infinity,                           
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(26, 26, 31, 1)
                            ),
                        ),
                        Positioned(
                            top: 0,
                            left: 20,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                        "ssh. ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold
                                        ),
                                        textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 10),
                                    
                                    
                                ],
                            )
                        )
                        
                    ],
                ),
        
        );
    }

}