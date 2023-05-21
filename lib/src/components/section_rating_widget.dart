import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/section_shaking.dart';

class RatingWidget extends StatefulWidget {
  final int rating;
  final String title;
  final bool autoplay;
  final TextStyle? style;

  const RatingWidget(
      {super.key,
      required this.rating,
      required this.title,
      this.style,
      required this.autoplay});

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  late int value;

  @override
  void initState() {
    value = widget.rating;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DisplayText(
          text: widget.title,
          style: widget.style ??
              const TextStyle(
                fontSize: 18.0,
                color: Colors.black54,
                fontWeight: FontWeight.w300,
              ),
        ),
        AnimatedShakingBuilder(
          autoPlay: widget.autoplay,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    value = index + 1;
                  });
                },
                child: Icon(
                  index < value ? Icons.star : Icons.star_border,
                  color: Colors.yellow,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
