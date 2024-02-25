import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';


class KReadMoreText extends StatelessWidget {
  const KReadMoreText({super.key, required this.text, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
        text,
        style: style,
        trimLines: 5,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Show more',
        trimExpandedText: 'Show less',
        moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold));
  }
}
