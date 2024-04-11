import 'package:flutter/material.dart';
import 'package:twitter_embed_card/svg_asset.dart';
import 'package:twitter_embed_card/svg_icon.dart';

class Contents extends StatelessWidget {
  final String contentText;
  final Image contentImage;
  final String contentCreatedAt;
  final int heartCount;

  const Contents({
    super.key,
    required this.contentText,
    required this.contentImage,
    required this.contentCreatedAt,
    required this.heartCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Content Text
        SelectableText(
          contentText,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),

        /// Content Image
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: contentImage,
        ),
        const SizedBox(
          height: 8.0,
        ),

        /// Content Info
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(contentCreatedAt),
            const SvgIcon(
              asset: SvgAsset.info,
              width: 20,
              height: 20,
            ),
          ],
        ),
        const Divider(),

        /// Content Heart, Reply, Copy link
        Row(
          children: [
            const SvgIcon(asset: SvgAsset.heartRed),
            const SizedBox(width: 8.0),
            Text(
              heartCount.toString(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 16.0),
            const SvgIcon(asset: SvgAsset.comment),
            const SizedBox(width: 8.0),
            const Text(
              'Reply',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 16.0),
            const SvgIcon(asset: SvgAsset.link),
            const SizedBox(width: 8.0),
            const Text(
              'Copy link',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
      ],
    );
  }
}
