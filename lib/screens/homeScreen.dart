import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walpapers/providers/providers.dart';
import 'package:walpapers/widgets/widgets.dart';
import 'package:get/get.dart';

class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.search),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Consumer(builder: (context, ref, child) {
              final wallpaperData = ref.watch(wallpaperProvider);
              return wallpaperData.when(
                data: (data) {
                  print(data);
                  return Image.network(
                    data[5].original!,
                    scale: 1.0,
                  );
                },
                loading: () => Center(child: CircularProgressIndicator()),
                error: (err, stack) => Text('$err'),
              );
            })
          ],
        ),
      ),
    );
  }
}
