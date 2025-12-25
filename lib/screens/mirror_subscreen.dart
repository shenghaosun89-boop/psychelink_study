
import '../models/theme_model.dart';
//import '../routes/app_routes.dart';
import 'package:flutter/material.dart';

class MirrorSubscreen extends StatefulWidget{
  final int themeIndex;
  const MirrorSubscreen({super.key, required this.themeIndex});

  @override
  State<MirrorSubscreen> createState() => _MirrorSubscreenState(); 
}

class _MirrorSubscreenState extends State<MirrorSubscreen> {
  late PageController _pageController;
  int _currentPage = 0;
  late ThemeModel _currentTheme;

  @override
  void initState() {
    super.initState();
    _currentTheme = themeList[widget.themeIndex];
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //背景图片
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _currentTheme.stepDataList.length,
            itemBuilder: (context, index) {
              StepData stepData = _currentTheme.stepDataList[index];
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(stepData.backgroundImage),
                    fit: BoxFit.cover
                  )
                ),
              );
            },
          ),

          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: (){
                    Navigator.pop(context);//返回上一个页面
                  },
                ),
                Expanded(//状态指示短横线
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: List.generate(_currentTheme.steps,(index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 20,
                        height: 3,
                        decoration: BoxDecoration(
                          color: _currentPage == index ? Colors.white : Colors.grey,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      )
                    )
                  ),
                ),
                SizedBox(width: 48),
              ],
            ),
          ),

          Positioned(//顶部文案1
            top: 100,
            left:0,
            right: 0,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
              child: Text(
                _currentTheme.stepDataList[_currentPage].topText,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.clip,
              ),
            ),
          ),

          Positioned(//底部文案2
            bottom: 50,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/btnStartRecord.png"),
                SizedBox(height: 10,),
                Text(
                  _currentTheme.stepDataList[_currentPage].bottomText,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  )
                )
              ],
            ),   
          )
        ],
      ),
    );
  }
}