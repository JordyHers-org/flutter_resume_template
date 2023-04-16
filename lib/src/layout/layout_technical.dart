import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/auto_size_text.dart';
import 'package:flutter_resume_template/src/components/section_bio_container.dart';
import 'package:flutter_resume_template/src/utils/strings.dart';

class LayoutTechnical extends StatefulWidget {
  const LayoutTechnical({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  State<LayoutTechnical> createState() => _LayoutTechnicalState();
}

class _LayoutTechnicalState extends State<LayoutTechnical> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        alignment: Alignment.centerRight,
        height: widget.h < 670 ? widget.h * 1.2 : Config.largeHeight,
        width: widget.w < 400 ? widget.w : widget.w * 0.2,
        margin: Config.margin,
        constraints: BoxConstraints(
          minWidth: widget.w < 400 ? widget.w * 1.2 : widget.w * 1,
          minHeight: widget.h < 670 ? widget.h * 1.2 : widget.h * 0.5,
          maxHeight: double.maxFinite,
          maxWidth: double.maxFinite,
        ),
        decoration: Config.decoration(context),
        child: Stack(
          children: [
            Positioned(
              top: 30,
              left: 30,
              child: DisplayText(
                text: 'Matthew Smith',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Positioned(
              top: 50,
              left: 30,
              child: DisplayText(
                text: 'Service Designer ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Positioned(
              top: 10,
              right: 30,
              child: DisplayText(
                text: '63 Fall Street',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Positioned(
              top: 30,
              right: 30,
              child: DisplayText(
                text: 'Toronto, ST 12874',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Positioned(
              top: 50,
              right: 30,
              child: DisplayText(
                text: 'Canada',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Positioned(
              top: 80,
              right: 30,
              child: DisplayText(
                text: '+1 (246) 869 453 00',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Positioned(
              top: 100,
              right: 30,
              child: DisplayText(
                text: 'matthewsmith@join.com',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const Positioned(
              top: 130,
              left: 30,
              right: 30,
              child: SHDivider(),
            ),
            Positioned(
              top: 150,
              left: 30,
              child: DisplayText(
                text: 'Short bio',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Positioned(
              top: 150,
              right: 30,
              child: SBContainer(
                child: DisplayText(
                  text: Str.bioText,
                  maxLines: 20,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(height: 1.2),
                ),
              ),
            ),
            const Positioned(
              top: 350,
              left: 30,
              right: 30,
              child: SHDivider(),
            ),
            Positioned(
              top: 370,
              left: 30,
              child: DisplayText(
                text: 'Work Experience',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Positioned(
              top: 370,
              right: 130,
              child: DisplayText(
                text: 'Creative Director',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Positioned(
              top: 390,
              right: 190,
              child: DisplayText(
                text: 'at Uber',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Positioned(
              top: 410,
              right: 110,
              child: DisplayText(
                text: 'Sep 2018 - Jan 2020',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Positioned(
              top: 430,
              right: 145,
              child: DisplayText(
                text: 'New York City',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Positioned(
              top: 460,
              right: 30,
              child: SBContainer(
                child: DisplayText(
                  text: Str.myRoleText,
                  maxLines: 20,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(height: 1.2),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Row(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: DisplayText(
                      text: 'Edit template',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(width: Config.tenPx),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white),
                    child: DisplayText(
                      text: 'Download CV ',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
