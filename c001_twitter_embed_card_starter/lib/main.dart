import 'package:flutter/material.dart';
import 'package:twitter_embed_card/component/contents.dart';
import 'package:twitter_embed_card/component/reply_button.dart';
import 'package:twitter_embed_card/component/user.dart';
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
            User(
              userImage: AssetImage('assets/andrea-avatar.png'),
              userName: 'Andrea Bizztto',
              userSubName: '@biz84',
            ),
            SvgIcon(
              asset: SvgAsset.x,
            ),
          ],
        ),

        const SizedBox(
          height: 16.0,
        ),

        /// Contents
        Contents(
          contentText:
              'Did you know?\n\nWhen you call `MediaQuery.of(context)` inside a build method, the widget will rebuild when *any* of the MediaQuery properties change.\n\nBut there\'s a better way that lets you depend only on the properties you care about (and minimize unnecessary rebuilds). 👇',
          contentImage: Image.asset(
            'assets/media-query-banner.jpg',
          ),
          contentCreatedAt: '10:21 AM • Jun 20, 2023',
          heartCount: 997,
        ),

        /// Reply Button
        const ReplyButton(),
      ],
    );
  }
}
