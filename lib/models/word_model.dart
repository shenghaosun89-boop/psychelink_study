class WordModel {
  final String keyWord;
  final String iconPath;
  final String description;
  final String backImgPath;
  final List<int> colorList;

  WordModel({
    required this.keyWord,
    required this.iconPath,
    required this.description,
    required this.backImgPath,
    required this.colorList,
  });
}

List<WordModel> wordsList = [
  WordModel(
    keyWord: "Health",
    iconPath: "assets/images/iconHealth.png",
    description: "Take a deep breath in the morning and fill your lungs with sunshine - health is the lowest form of luxury!",
    backImgPath: "assets/images/usefulBanner/imgWordsHealth@3x.png",
    colorList: [220, 255, 203, 1],
  ),

  WordModel(
    keyWord: "Love",
    iconPath: "assets/images/iconLove.png",
    description: "Take a deep breath in the morning and fill your lungs with sunshine - health is the lowest form of luxury!",
    backImgPath: "assets/images/usefulBanner/imgWordsLove@3x.png",
    colorList: [251, 185, 210, 1],
  ),

  WordModel(
    keyWord: "Career",
    iconPath: "assets/images/iconCareer.png",
    description: "Take a deep breath in the morning and fill your lungs with sunshine - health is the lowest form of luxury!",
    backImgPath: "assets/images/usefulBanner/imgWordsCareerz@3x.png",
    colorList: [202, 227, 255, 1],
  ),

  WordModel(
    keyWord: "Family",
    iconPath: "assets/images/iconFamily.png",
    description: "Take a deep breath in the morning and fill your lungs with sunshine - health is the lowest form of luxury!",
    backImgPath: "assets/images/usefulBanner/imgWordsFamily@3x.png",
    colorList: [255, 231, 206, 1],
  ),

  WordModel(
    keyWord: "Study",
    iconPath: "assets/images/iconStudies.png",
    description: "Take a deep breath in the morning and fill your lungs with sunshine - health is the lowest form of luxury!",
    backImgPath: "assets/images/usefulBanner/imgWordsStudies@3x.png",
    colorList: [213, 211, 255 , 1],
  ),
];