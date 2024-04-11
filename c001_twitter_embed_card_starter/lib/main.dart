import 'package:flutter/material.dart';
import 'package:twitter_embed_card/svg_asset.dart';
import 'package:twitter_embed_card/svg_icon.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SvgAsset.preloadSVGs();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: SizedBox(
              width: 600, // max allowed width
              child: TwitterEmbedCard(),
            ),
          ),
        ),
      ),
    );
  }
}

class TwitterEmbedCard extends StatelessWidget {
  const TwitterEmbedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// User And Twitter Icon
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/andrea-avatar.png'),
                ),
                SizedBox(width: 8.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Andrea Bizztto',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8.0),
                        SvgIcon(
                          asset: SvgAsset.heartBlue,
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 8.0),
                        SvgIcon(
                          asset: SvgAsset.verified,
                          width: 20,
                          height: 20,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '@biz84 • ',
                        ),
                        Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SvgIcon(
              asset: SvgAsset.x,
            ),
          ],
        ),

        /// Content Text
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.0,
            ),
            SelectableText(
              'Did you know?\n\nWhen you call `MediaQuery.of(context)` inside a build method, the widget will rebuild when *any* of the MediaQuery properties change.\n\nBut there\'s a better way that lets you depend only on the properties you care about (and minimize unnecessary rebuilds). 👇',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
          ],
        ),

        /// Content Image
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset(
            'assets/media-query-banner.jpg',
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),

        /// Content Info
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('10:21 AM • Jun 20, 2023'),
            SvgIcon(
              asset: SvgAsset.info,
              width: 20,
              height: 20,
            ),
          ],
        ),
        const Divider(),

        /// Content Heart, Reply, Copy link
        const Row(
          children: [
            SvgIcon(asset: SvgAsset.heartRed),
            SizedBox(width: 8.0),
            Text(
              '997',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 16.0),
            SvgIcon(asset: SvgAsset.comment),
            SizedBox(width: 8.0),
            Text(
              'Reply',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 16.0),
            SvgIcon(asset: SvgAsset.link),
            SizedBox(width: 8.0),
            Text(
              'Copy link',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),

        /// Reply Button
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              side: const BorderSide(color: Colors.black, width: 0.5),
            ),
            onPressed: () {},
            child: const Text(
              'Read 12 replies',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
