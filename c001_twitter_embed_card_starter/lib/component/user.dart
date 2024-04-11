import 'package:flutter/material.dart';
import 'package:twitter_embed_card/svg_asset.dart';
import 'package:twitter_embed_card/svg_icon.dart';

class User extends StatelessWidget {
  final AssetImage userImage;
  final String userName;
  final String userSubName;

  const User({
    super.key,
    required this.userImage,
    required this.userName,
    required this.userSubName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: userImage,
        ),
        const SizedBox(width: 8.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  userName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8.0),
                const SvgIcon(
                  asset: SvgAsset.heartBlue,
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 8.0),
                const SvgIcon(
                  asset: SvgAsset.verified,
                  width: 20,
                  height: 20,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '$userSubName • ',
                ),
                const Text(
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
    );
  }
}
