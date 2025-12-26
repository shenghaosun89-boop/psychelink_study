import '../models/theme_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 收藏项目数据类
class FavoriteItem {
  final String text;
  final DateTime time;
  final int themeIndex;
  final int pageIndex;

  FavoriteItem({
    required this.text,
    required this.time,
    required this.themeIndex,
    required this.pageIndex,
  });
}

class MirrorSubscreenUtils {
  static Future<List<FavoriteItem>> getAllFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<FavoriteItem> favorites = [];

    // 遍历所有的主题和页面来查找收藏
    for (int themeIndex = 0; themeIndex < themeList.length; themeIndex++) {
      ThemeModel theme = themeList[themeIndex];
      
      for (int pageIndex = 0; pageIndex < theme.steps; pageIndex++) {
        String favoriteKey = 'favorite_theme_${themeIndex}_page_$pageIndex';
        
        if (prefs.getBool(favoriteKey) == true) {
          String? text = prefs.getString('favorite_text_theme_${themeIndex}_page_$pageIndex');
          String? timeStr = prefs.getString('favorite_time_theme_${themeIndex}_page_$pageIndex');
          
          if (text != null && timeStr != null) {
            try {
              DateTime time = DateTime.parse(timeStr);
              favorites.add(FavoriteItem(
                text: text,
                time: time,
                themeIndex: themeIndex,
                pageIndex: pageIndex,
              ));
            } catch (e) {
              // 如果时间解析失败，跳过此项
              continue;
            }
          }
        }
      }
    }

    favorites.sort((a, b) => b.time.compareTo(a.time));
    
    return favorites;
  }
}