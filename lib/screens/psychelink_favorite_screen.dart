import 'package:flutter/material.dart';
import 'dart:ui';
import '../utils/favorite_utils.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  //int _selectedIndex = 0;

  List<FavoriteItem> _favorites = [];

  @override
  void initState() {
    super.initState();
    //_selectedIndex = 1;
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    try {
      List<FavoriteItem> favorites = await MirrorSubscreenUtils.getAllFavorites();
      setState(() {
        _favorites = favorites;
        //_isLoading = false;
      });
    } catch (e) {
      print("Error loading favorites: $e");
    }
  }

  // void _onItemTapped(int index) {
  //     setState(() {
  //         _selectedIndex = index;
  //     });

  //     // 根据选中的索引导航到不同的页面
  //     switch (index) {
  //         case 0: // Home
  //             Navigator.pushNamed(context, '/home');
  //             break;
  //         case 1: // Favorites
  //             // 当前页面，无需导航
  //             break;
  //         case 2: // Words
  //             Navigator.pushNamed(context, '/words');
  //             break;
  //         case 3: // Mine
  //             Navigator.pushNamed(context, '/mine');
  //             break;
  //     }
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          if (_favorites.isEmpty) 
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(26, 26, 31, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/imgFavoritesPlaceholder.png",
                    width: 140,
                    height: 140,
                    fit: BoxFit.contain,
                  ),
                  //SizedBox(height: 10),
                  Text(
                    "No favorites for now",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
            
          else 
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(26, 26, 31, 1),
              ),
              child: ListView.builder(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 100),
                itemCount: _favorites.length,
                itemBuilder: (context, index) {
                  FavoriteItem item = _favorites[index];
                  String formattedDate = "${item.time.year}-${item.time.month.toString().padLeft(2, '0')}-${item.time.day.toString().padLeft(2, '0')}";
                  
                  return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(36, 43, 47, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.text,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                formattedDate,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/btnCollected.png",
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(width: 15,),

                            Image.asset(
                              "assets/images/btnReading.png",
                              width: 24,
                              height: 24,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
        ],        
    );
  }
}
