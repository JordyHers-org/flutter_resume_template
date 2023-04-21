/*
 * Flutter Resume Template
 *
 * © [2023] Jordy Hershel Igondjo. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * All materials and credentials used in this software remain the exclusive
 * property of Jordy Hershel Igondjo, and may not be used, reproduced, or
 * distributed without express permission from Jordy Hershel Igondjo.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/utils/strings.dart';
import 'package:flutter_resume_template/src/utils/typedef_utils.dart';

class FlutterResumeTemplate extends StatefulWidget {
  /// The [TemplateTheme] class holds two main information:
  /// The template type and the theme data;
  ///The theme and visual appearance depend on the selected
  /// TemplateType.
  ///
  final TemplateTheme templateTheme;

  /// If  [withButtons] is true the buttons to edit and
  /// save the resume will be displayed at the bottom of the page.
  /// Do not worry the buttons will not be displayed on the final PDF
  /// version of the resume.
  ///
  /// When buttons are enabled you can either edit template or save the Resume as
  /// PDF in your local device storage. Keep in mind that the editing is still `experimental`
  /// some functionalities may not work as expected.
  final bool? withButtons;

  /// The [TemplateData] class holds the general values available on the
  /// on the resume. They are specifically separated to make them quite
  /// modular. the [fullName] and [currentPosition] are on the top left.
  ///
  /// The  [street] , [address], [country], [email] and [phoneNumber] are
  /// all at the top right corner. Although the location depend on the
  /// template type.
  ///
  final TemplateData? data;

  /// The [onEmpty] builder will ensure something is visually rendered
  /// and prevents an empty container from showing up.
  ///
  /// both values can't be null, either data is null and [onEmpty] is defined
  /// or the onEmpty method is defined and [data] is null.
  /// The onEmpty can be used to return your own custom template widget.
  ///
  final ResumeBuilder<Widget>? onEmpty;

  const FlutterResumeTemplate({
    Key? key,
    required this.templateTheme,
    this.data,
    this.withButtons = false,
    this.onEmpty,
  })  : assert(data != null || onEmpty != null),
        super(key: key);

  @override
  State<FlutterResumeTemplate> createState() => _FlutterResumeTemplateState();
}

class _FlutterResumeTemplateState extends State<FlutterResumeTemplate> {
  @override
  Widget build(BuildContext context) {
    final double h = Config.dynamicHeight(context);
    final double w = Config.dynamicWidth(context);

    return Theme(
      data: widget.templateTheme.themeData,
      child: LayoutBuilder(builder: (context, _) {
        switch (widget.templateTheme.type) {
          case TemplateType.modernResume:
            return LayoutModern(
              h: h,
              w: w,
              withButtons: widget.withButtons,
              data: widget.data ?? Str.mockData,
            );
          case TemplateType.classicResume:
            return LayoutClassic(
              h: h,
              w: w,
              withButtons: widget.withButtons,
              data: widget.data ?? Str.mockData,
            );
          case TemplateType.technicalResume:
            return LayoutTechnical(
              h: h,
              w: w,
              withButtons: widget.withButtons,
              data: widget.data ?? Str.mockData,
            );
          case TemplateType.businessResume:
            return LayoutBusiness(
              h: h,
              w: w,
              withButtons: widget.withButtons,
              data: widget.data ?? Str.mockData,
            );
          case TemplateType.none:
            if (widget.onEmpty != null) {
              return widget.onEmpty!(context);
            } else {
              return LayoutBusiness(
                h: h,
                w: w,
                withButtons: widget.withButtons,
                data: widget.data ?? Str.mockData,
              );
            }
        }
      }),
    );
  }
}
