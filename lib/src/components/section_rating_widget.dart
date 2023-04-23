import 'package:flutter/material.dart';
import 'package:flutter_resume_template/src/components/auto_size_text.dart';

class RatingWidget extends StatelessWidget {
  final int rating;
  final String title;
  final TextStyle? style;

  RatingWidget({required this.rating, required this.title, this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DisplayText(
          text: title,
          style: style ??
              const TextStyle(
                fontSize: 18.0,
                color: Colors.black54,
                fontWeight: FontWeight.w300,
              ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => Icon(
              index < rating ? Icons.star : Icons.star_border,
              color: Colors.yellow,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
