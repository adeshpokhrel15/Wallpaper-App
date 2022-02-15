import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walpapers/models/models.dart';
import 'package:dio/dio.dart';

// final wallpaperProvider =
//     StateNotifierProvider<WallpaperProvider, List<Wallpaper>>(
//         (ref) => WallpaperProvider());

// class WallpaperProvider extends StateNotifier<List<Wallpaper>> {
//   WallpaperProvider() : super([]) {
//     getData();
//   }
// }

final wallpaperProvider =
    FutureProvider((ref) => WallpaperProvider().getData());

class WallpaperProvider {
  Future<List<Wallpaper>> getData() async {
    final dio = Dio();

    try {
      final response = await dio.get(
          'https://api.pexels.com/v1/search?query=people',
          queryParameters: {
            'query': 'coding',
            'page': '1',
          },
          options: Options(headers: {
            'Authorization':
                '563492ad6f91700001000001637c9af347cd415e87f809df5defc023'
          }));
      List<Wallpaper> wallpapers = (response.data['photos'] as List).map((e) {
        return Wallpaper.fromJson(e);
      }).toList();

      // print(response.data);
      return wallpapers;
    } on DioError catch (e) {
      throw e;
    }
  }
}
