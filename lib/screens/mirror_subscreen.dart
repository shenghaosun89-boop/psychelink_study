
import '../models/theme_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../utils/lock_status_notifier.dart';

class MirrorSubscreen extends StatefulWidget{
  final int themeIndex;
  final bool isLocked;
  const MirrorSubscreen({super.key, required this.themeIndex, required this.isLocked});

  @override
  State<MirrorSubscreen> createState() => _MirrorSubscreenState(); 
}

class _MirrorSubscreenState extends State<MirrorSubscreen> {
  late PageController _pageController;
  int _currentPage = 0;
  bool _isRecording = false;
  late ThemeModel _currentTheme;
  late List<bool> _stepCompletionStatus;
  late int _maxCompletedPage;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _currentTheme = themeList[widget.themeIndex];
    _pageController = PageController(initialPage: 0);

    _stepCompletionStatus = List.generate(_currentTheme.steps, (index) => false);
    _maxCompletedPage = 0;

    _loadCompletionStatus();
    _loadFavoriteStatus();
  }

  //加载本地的详情页完成进度
  Future<void> _loadCompletionStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < _currentTheme.steps; i++) {
      String key = 'theme_${widget.themeIndex}_step_$i';
      _stepCompletionStatus[i] = prefs.getBool(key) ?? false;

      if (_stepCompletionStatus[i]) {
        _maxCompletedPage = i;
      }
    }

    if (_maxCompletedPage >0) {
      for (int i = 0; i < _currentTheme.steps; i++) {
        if (!_stepCompletionStatus[i]) {
          _maxCompletedPage = i > 0 ? i - 1 : 0;
          break; 
        }
      }
    }

    setState(() {});
  }

  //加载收藏状态
  Future<void> _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String favoriteKey = 'favorite_theme_${widget.themeIndex}_page_$_currentPage';
    setState(() {
      _isFavorite = prefs.getBool(favoriteKey) ?? false;
    });
  }

  //保存收藏状态
  Future<void> _saveFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String favoriteKey = 'favorite_theme_${widget.themeIndex}_page_$_currentPage';
    if (_isFavorite) {
      //收藏文案和收藏时间
      await prefs.setBool(favoriteKey, true);
      await prefs.setString('favorite_text_theme_${widget.themeIndex}_page_$_currentPage', _currentTheme.stepDataList[_currentPage].topText);
      await prefs.setString('favorite_time_theme_${widget.themeIndex}_page_$_currentPage', DateTime.now().toString());
    } else {//取消收藏
      await prefs.remove(favoriteKey);
      await prefs.remove('favorite_text_theme_${widget.themeIndex}_page_$_currentPage');
      await prefs.remove('favorite_time_theme_${widget.themeIndex}_page_$_currentPage');
    }
  }

  //保存步骤完成状态到本地
  Future<void> _saveStepCompletion(int stepIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = 'theme_${widget.themeIndex}_step_$stepIndex';
    await prefs.setBool(key, _stepCompletionStatus[stepIndex]);
  }

  void _handleFavoriteButtonTap() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    _saveFavoriteStatus();
  }

  //点击录音按钮时触发：
  void _handleRecordButtonTap() {
    if (_currentPage > _maxCompletedPage + 1) {
      return;
    }

    setState(() {
      _isRecording = !_isRecording;
      if (_isRecording && _currentPage < _currentTheme.steps && !_stepCompletionStatus[_currentPage]) {
        _stepCompletionStatus[_currentPage] = true;
        _maxCompletedPage = _currentPage;
        _saveStepCompletion(_currentPage);
        if (_currentPage == _currentTheme.steps - 1) {
          LockStatusNotifier().notifyStatusChanged('LOCK_STATUS_CHANGED');
        }
      }
    });
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
                _isRecording = false;
                _loadFavoriteStatus();
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

          if (widget.isLocked) 
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
                ]
              )  
            ),

          if (!widget.isLocked)
            Positioned(//状态指示短横线
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
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(_currentTheme.steps,(index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: 20,
                          height: 20,
                          child: _stepCompletionStatus[index]
                            ? Image.asset(_currentPage == index
                                ? "assets/images/check-white.png"
                                : "assets/images/check-grey.png",
                                width: 20,
                                height: 20)
                            : Align(  
                                alignment: Alignment.center,
                                child: Container(
                                  width: 20,
                                  height: 3,
                                  decoration: BoxDecoration(
                                    color: _currentPage == index ? Colors.white : Colors.grey,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              )
                        )
                      )
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),
            ),

          if (widget.isLocked)//未解锁的页面布局
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.05,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [                   
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(_currentTheme.steps,(index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        width: 30,
                        height: 30,
                        child: _stepCompletionStatus[index]
                          ? Image.asset(_currentPage == index
                              ? "assets/images/check-white.png"
                              : "assets/images/check-grey.png",
                              width: 30,
                              height: 30)
                          : Align(  
                              alignment: Alignment.center,
                              child: Container(
                                width: 30,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: _currentPage == index ? Colors.white : Colors.grey,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            )
                      )
                    )
                  ),
                  SizedBox(height: 20),

                  Image.asset(
                    "assets/images/iconPopLocked.png"
                  ),
                  SizedBox(height: 10),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "You need to complete the first four exercises to unlock the course.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(28)
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: const Color.fromRGBO(94, 100, 228, 1)
                    ),
                    child: SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Center(
                        child: Text(
                          "OK",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  )
                ],
              )
            ),

          if (!widget.isLocked)
            Positioned(//顶部文案1
              top: 100,
              left:0,
              right: 0,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Text(
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
                    SizedBox(height: 20),

                    Row(//转发收藏播放
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //1.转发
                        Image.asset("assets/images/btnShare.png"),
                        SizedBox(width: 30),
                        //2.收藏
                        GestureDetector(
                          onTap: _handleFavoriteButtonTap,
                          child: Image.asset(
                            _isFavorite ? "assets/images/btnCollected.png" : "assets/images/btnCollect.png",
                          ),
                        ),
                        SizedBox(width: 30),
                        //3.播放
                        Image.asset("assets/images/btnReading.png"),
                        SizedBox(width: 30),
                      ],
                    )
                  ],
                )
              ),
            ),
          if (!widget.isLocked)
            Positioned(//底部文案2
              bottom: 50,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(//录制/停止录制按钮
                    onTap: () {
                      _handleRecordButtonTap();
                    },child: Image.asset(_isRecording 
                      ? "assets/images/btnRecordingPaused.png" 
                      : "assets/images/btnStartRecord.png"
                    ),
                  ),                
                  SizedBox(height: 10,),
                  Text(
                    _isRecording
                      ? "Recording your voice now..."
                      :_currentTheme.stepDataList[_currentPage].bottomText,
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