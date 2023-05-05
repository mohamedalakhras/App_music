import 'dart:math';

import 'package:flutter/material.dart';
import 'package:music_app/music_page/musicpage.dart';
import 'package:music_app/service/api_music.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Apimusic apimusic = Apimusic();

  Future musictest() async {
    final test = await apimusic.gitAllMusic();
    setState(() {
      apimusic.musicList = test;
    });
  }

  @override
  void initState() {
    super.initState();
    musictest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: apimusic.musicList.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MusicDetailPage(
                                music: apimusic.musicList[index])));
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, bottom: 8, right: 8, top: 4),
                          child: SizedBox(
                            child: FadeInImage.assetNetwork(
                                height: 60,
                                width: 60,
                                placeholder: "assets/images/download.jpeg",
                                image:
                                    apimusic.musicList[index].image.toString(),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              apimusic.musicList[index].title.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              apimusic.musicList[index].artist.toString(),
                              style: const TextStyle(
                                  color: Colors.black45, fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
