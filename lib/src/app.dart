import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/auto_size_text.dart';
import 'package:flutter_resume_template/src/components/section_bio_container.dart';
import 'package:flutter_resume_template/src/utils/strings.dart';

class FlutterResumeTemplate extends StatefulWidget {
  final TemplateTheme templateTheme;

  const FlutterResumeTemplate({Key? key, required this.templateTheme})
      : super(key: key);

  @override
  State<FlutterResumeTemplate> createState() => _FlutterResumeTemplateState();
}

class _FlutterResumeTemplateState extends State<FlutterResumeTemplate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config.largeHeight,
      width: Config.largeWidth,
      margin: Config.margin,
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
            top: 180,
            left: 30,
            right: 30,
            child: SHDivider(),
          ),
          Positioned(
            top: 200,
            left: 30,
            child: DisplayText(
              text: 'Short bio',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Positioned(
            top: 200,
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
            top: 450,
            left: 30,
            right: 30,
            child: SHDivider(),
          ),
          Positioned(
            top: 470,
            left: 30,
            child: DisplayText(
              text: 'Work Experience',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Positioned(
            top: 470,
            right: 130,
            child: DisplayText(
              text: 'Creative Director',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Positioned(
            top: 490,
            right: 190,
            child: DisplayText(
              text: 'at Uber',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Positioned(
            top: 510,
            right: 110,
            child: DisplayText(
              text: 'Sep 2018 - Jan 2020',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Positioned(
            top: 530,
            right: 145,
            child: DisplayText(
              text: 'New York City',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Positioned(
            top: 570,
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
            top: 690,
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
    );
  }
}
