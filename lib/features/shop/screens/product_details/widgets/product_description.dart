import 'package:az_store/common/widgets/kread_more.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return KReadMoreText(text: description);
  }
}
