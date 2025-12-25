
import 'package:psychelink_study/routes/app_routes.dart';

class ThemeModel {
  final String keyWord;
  final String buttonImage;
  final String description;
  final int steps;
  final String subPageRoute;
  final List<StepData> stepDataList;
  
  ThemeModel({
    required this.keyWord,
    required this.buttonImage,
    required this.description,
    required this.steps,
    required this.subPageRoute,
    required this.stepDataList,
  });
}

class StepData {
  final String backgroundImage;
  final String topText;
  final String bottomText;

  StepData({
    required this.backgroundImage,
    required this.topText,
    required this.bottomText,
  });
}

List<ThemeModel> themeList = [
  ThemeModel(
    keyWord: "Mirror",
    buttonImage: "assets/images/usefulBanner/imgMirrorCover@2x.png",
    description: "Direction of the mind",
    steps: 6,
    subPageRoute: AppRoutes.mirrorSubPage,
    stepDataList: [
      StepData(//step1
        backgroundImage: "assets/images/usefulBanner/imgMirror1.png",
        topText: "Taking charge of my own happiness.Taking charge of.",
        bottomText: "Touch to start recording",
      ),
      StepData(//step2
        backgroundImage: "assets/images/usefulBanner/imgMirror2.png",
        topText: "Taking charge of my own happiness.",
        bottomText: "Good job!",
      ),
      StepData(//step3
        backgroundImage: "assets/images/usefulBanner/imgMirror3.png",
        topText: "Taking charge of my own happiness.Taking charge of.",
        bottomText: "Almost there, try again!",
      ),
      StepData(//step4
        backgroundImage: "assets/images/usefulBanner/imgMirror4.png",
        topText: "Taking charge of my own happiness.",
        bottomText: "Good job!",
      ),
      StepData(//step5
        backgroundImage: "assets/images/usefulBanner/imgMirror5.png",
        topText: "Taking charge of my own happiness.Taking charge of.",
        bottomText: "Almost there, try again!",
      ),
      StepData(//step6
        backgroundImage: "assets/images/usefulBanner/imgMirror6.png",
        topText: "Taking charge of my own happiness.",
        bottomText: "Good job!",
      ),
    ]
  ),

  ThemeModel(
    keyWord: "Lotus",
    buttonImage: "assets/images/usefulBanner/imgLotusCover@2x.png",
    description: "Direction of the mind",
    steps: 5,
    subPageRoute: AppRoutes.mirrorSubPage,
    stepDataList: [
      StepData(//step1
        backgroundImage: "assets/images/usefulBanner/imgLotus1.png",
        topText: "Taking charge of my own happiness.",
        bottomText: "Touch to start recording",
      ),
      StepData(//step2
        backgroundImage: "assets/images/usefulBanner/imgLotus2.png",
        topText: "Taking charge of my own happiness.Taking charge of.",
        bottomText: "Good job!",
      ),
      StepData(//step3
        backgroundImage: "assets/images/usefulBanner/imgLotus3.png",
        topText: "Taking charge of my own happiness.",
        bottomText: "Almost there, try again!",
      ),
      StepData(//step4
        backgroundImage: "assets/images/usefulBanner/imgLotus4.png",
        topText: "Taking charge of my own happiness.Taking charge of.",
        bottomText: "Good job!",
      ),
      StepData(//step5
        backgroundImage: "assets/images/usefulBanner/imgLotus5.png",
        topText: "Taking charge of my own happiness.",
        bottomText: "Almost there, try again!",
      ),
    ]
  ),

  ThemeModel(
    keyWord: "Bubbles",
    buttonImage: "assets/images/usefulBanner/imgBubblesCover@2x.png",
    description: "Direction of the mind",
    steps:4,
    subPageRoute: AppRoutes.mirrorSubPage,
    stepDataList: [
      StepData(//step1
        backgroundImage: "assets/images/usefulBanner/imgBubbles1.png",
        topText: "Taking charge of my own happiness.Taking charge of.",
        bottomText: "Touch to start recording",
      ),
      StepData(//step2
        backgroundImage: "assets/images/usefulBanner/imgBubbles2.png",
        topText: "Taking charge of my own happiness.",
        bottomText: "Almost there, try again!",
      ),
      StepData(//step3
        backgroundImage: "assets/images/usefulBanner/imgBubbles3.png",
        topText: "Taking charge of my own happiness.Taking charge of.",
        bottomText: "Good job!",
      ),
      StepData(//step4
        backgroundImage: "assets/images/usefulBanner/imgBubbles4.png",
        topText: "Taking charge of my own happiness.",
        bottomText: "Almost there, try again!",
      ),    
    ]
  ),

  ThemeModel(
    keyWord: "Spring",
    buttonImage: "assets/images/usefulBanner/imgSpringCover@2x.png",
    description: "Direction of the mind",
    steps:3,
    subPageRoute: AppRoutes.mirrorSubPage,
    stepDataList: [
      StepData(//step1
        backgroundImage: "assets/images/usefulBanner/imgSpring1.png",
        topText: "Taking charge of my own happiness.Taking charge of.",
        bottomText: "Touch to start recording",
      ),
      StepData(//step2
        backgroundImage: "assets/images/usefulBanner/imgSpring2.png",
        topText: "Taking charge of my own happiness.",
        bottomText: "Almost there, try again!",
      ),
      StepData(//step3
        backgroundImage: "assets/images/usefulBanner/imgSpring3.png",
        topText: "Taking charge of my own happiness.Taking charge of.",
        bottomText: "Good job!",
      ),
    ]
  ),

  ThemeModel(
    keyWord: "Apple",
    buttonImage: "assets/images/usefulBanner/imgAppleCover@2x.png",
    description: "Direction of the mind",
    steps:4,
    subPageRoute: AppRoutes.mirrorSubPage,
    stepDataList: [
      StepData(//step1
        backgroundImage: "assets/images/usefulBanner/imgApple1.png",
        topText: "Taking charge of my own happiness.Taking charge of.",
        bottomText: "Touch to start recording",
      ),
      StepData(//step2
        backgroundImage: "assets/images/usefulBanner/imgApple2.png",
        topText: "Taking charge of my own happiness.",
        bottomText: "Almost there, try again!",
      ),
      StepData(//step3
        backgroundImage: "assets/images/usefulBanner/imgApple3.png",
        topText: "Taking charge of my own happiness.Taking charge of.",
        bottomText: "Good job!",
      ),
      StepData(//step4
        backgroundImage: "assets/images/usefulBanner/imgApple4.png",
        topText: "Taking charge of my own happiness.",
        bottomText: "Almost there, try again!",
      ),
    ]
  ),

  ThemeModel(
    keyWord: "Flower",
    buttonImage: "assets/images/usefulBanner/imgFlowerCover@2x.png",
    description: "Direction of the mind",
    steps:5,
    subPageRoute: AppRoutes.mirrorSubPage,
    stepDataList: [
      StepData(//step1
        backgroundImage: "assets/images/usefulBanner/imgFlower1.png",
        topText: "Taking charge of my own happiness.Taking charge of.",
        bottomText: "Touch to start recording",
      ),
      StepData(//step2
        backgroundImage: "assets/images/usefulBanner/imgFlower2.png",
        topText: "Taking charge of my own happiness.",
        bottomText: "Almost there, try again!",
      ),
      StepData(//step3
        backgroundImage: "assets/images/usefulBanner/imgFlower3.png",
        topText: "Taking charge of my own happiness.Taking charge of.",
        bottomText: "Good job!",
      ),
      StepData(//step4
        backgroundImage: "assets/images/usefulBanner/imgFlower4.png",
        topText: "Taking charge of my own happiness.",
        bottomText: "Almost there, try again!",
      ),
      StepData(//step5
        backgroundImage: "assets/images/usefulBanner/imgFlower5.png",
        topText: "Taking charge of my own happiness.Taking charge of.",
        bottomText: "Good job!",
      ),
    ]
  ), 
];