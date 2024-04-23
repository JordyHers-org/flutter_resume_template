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
import 'package:flutter/material.dart';
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

  /// If  [mode] is given the user will experience different behavior on the widget
  ///
  /// The modes are
  ///
  /// [TemplateMode.onlyEditableMode] - The Resume can be edited , zoomed in- out
  ///
  /// [TemplateMode.shakeEditAndSaveMode] - The Resume will shake while being updated
  ///
  /// [TemplateMode.readOnlyMode] - The resume template can't be edited. All actions on
  ///
  ///the template will be dismissed.
  ///
  final TemplateMode mode;

  /// The [TemplateData] class holds the general values available on the
  /// on the resume. They are specifically separated to make them quite
  /// modular. the [fullName] and [currentPosition] are on the top left.
  ///
  /// The  [street] , [address], [country], [email] and [phoneNumber] are
  /// all at the top right corner. Although the location depend on the
  /// template type. Other classes allow you to pass more specific data
  /// such as [Education], [Language] and [ExperienceData].
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

  /// To save a pdf version of the update resume the function [onSaveResume] is passed
  ///
  /// only enable it if mode is [TemplateMode.shakeEditAndSaveMode]
  /// then just us a Future to create the PDF receiving the globalGey
  ///
  /// await Future.delayed(
  ///    const Duration(milliseconds: 300))
  ///       .then((value) =>
  ///       PdfHandler().createResume(_globalKey));
  ///
  ///
  final SaveResume<GlobalKey>? onSaveResume;

  /// The [backgroundColor] only changes the background color of the
  /// Resume template. Pay attention the entire scaffold color
  /// does not change. The placeholder value of the Section title.
  ///
  final Color? backgroundColor;

  /// The [backgroundColorLeftSection] only changes the background color of the
  /// left section of Resume template when the mode is [Modern]
  ///
  final Color? backgroundColorLeftSection;

  /// The [aboutMePlaceholder] changes the value of the commonly used
  /// about me or biography section. The placeholder value
  /// of the Section title.
  ///
  final String? aboutMePlaceholder;

  /// The [educationPlaceHolder] changes the value of the commonly used
  /// education section holding as values the school name and the grade or
  /// education level. The placeholder value of the Section title.
  ///
  final String? educationPlaceHolder;

  /// The [hobbiesPlaceholder] changes the value of the commonly used
  /// hobby section. Skills can be used too  The placeholder value of
  /// the Section title.
  ///
  final String? hobbiesPlaceholder;

  /// The [emailPlaceHolder] changes the value of the commonly used
  /// email. The placeholder value of the Section title.
  ///
  final String? emailPlaceHolder;

  /// The [telPlaceHolder] changes the value of the commonly used
  /// telephone. The placeholder value of the Section title.
  ///
  final String? telPlaceHolder;

  /// The [experiencePlaceHolder] changes the value of the commonly used
  /// experience. The placeholder value of the Experience Section title.
  ///
  final String? experiencePlaceHolder;

  /// The [languagePlaceHolder] changes the value of the commonly used
  /// experience. The placeholder value of the Language Section title.
  ///
  final String? languagePlaceHolder;

  /// The [imageHeight]
  final double? imageHeight;

  /// The [imageWidth]
  final double? imageWidth;

  /// The [imageRadius]
  final double? imageRadius;

  /// The [imageBoxFit]
  final BoxFit? imageBoxFit;

  /// This [enableDivider] will enable or disable all
  /// the dividers in several section. Note that all
  /// the template do not have `SHDivider`
  final bool? enableDivider;

  /// Enter the maxLines the experience widget should take
  final int? maxLinesExperience;

  /// Decide if you should show or hide the animate and download button only in
  /// [shakeAndEditButton] mode
  final bool showButtons;

  /// This value is the entire widget height
  final double? height;

  /// This value is the entire widget width
  final double? width;

  /// This value is used to define the spacing vertical or horizontal between
  /// hobbies values. Only for the [TemplateTheme.modern]
  final EdgeInsetsGeometry? hobbiesPadding;

  /// The social medial placeholder is a widget that receives the
  /// different social media accounts
  final Widget? socialMediaPlaceholder;

  const FlutterResumeTemplate({
    Key? key,
    required this.templateTheme,
    this.data,
    this.maxLinesExperience,
    this.onEmpty,
    this.onSaveResume,
    this.backgroundColor,
    this.aboutMePlaceholder,
    this.hobbiesPlaceholder,
    this.emailPlaceHolder,
    this.telPlaceHolder,
    this.experiencePlaceHolder,
    this.educationPlaceHolder,
    this.languagePlaceHolder,
    this.hobbiesPadding,
    this.imageHeight,
    this.imageWidth,
    this.imageRadius,
    this.imageBoxFit,
    this.height,
    this.width,
    this.enableDivider = true,
    this.showButtons = true,
    this.backgroundColorLeftSection,
    this.socialMediaPlaceholder,
    this.mode = TemplateMode.onlyEditableMode,
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
              height: widget.height,
              width: widget.width,
              showButtons: widget.showButtons,
              imageBoxFit: widget.imageBoxFit,
              imageHeight: widget.imageHeight,
              imageRadius: widget.imageRadius,
              imageWidth: widget.imageWidth,
              educationPlaceHolder: widget.educationPlaceHolder,
              enableDividers: widget.enableDivider,
              backgroundColor: widget.backgroundColor,
              emailPlaceHolder: widget.emailPlaceHolder,
              aboutMePlaceholder: widget.aboutMePlaceholder,
              experiencePlaceHolder: widget.experiencePlaceHolder,
              backgroundColorLeftSection: widget.backgroundColorLeftSection,
              maxLinesExperience: widget.maxLinesExperience,
              telPlaceHolder: widget.telPlaceHolder,
              languagePlaceHolder: widget.languagePlaceHolder,
              hobbiesPlaceholder: widget.hobbiesPlaceholder,
              hobbiesPadding: widget.hobbiesPadding,
              onSaveResume: widget.onSaveResume,
              socialMediaPlaceholder: widget.socialMediaPlaceholder,
              mode: widget.mode,
              data: widget.data ?? Str.mockData,
            );
          case TemplateType.classicResume:
            return LayoutClassic(
              h: h,
              w: w,
              height: widget.height,
              width: widget.width,
              showButtons: widget.showButtons,
              imageBoxFit: widget.imageBoxFit,
              imageHeight: widget.imageHeight,
              imageRadius: widget.imageRadius,
              imageWidth: widget.imageWidth,
              educationPlaceHolder: widget.educationPlaceHolder,
              enableDividers: widget.enableDivider,
              backgroundColor: widget.backgroundColor,
              emailPlaceHolder: widget.emailPlaceHolder,
              aboutMePlaceholder: widget.aboutMePlaceholder,
              experiencePlaceHolder: widget.experiencePlaceHolder,
              maxLinesExperience: widget.maxLinesExperience,
              telPlaceHolder: widget.telPlaceHolder,
              languagePlaceHolder: widget.languagePlaceHolder,
              hobbiesPlaceholder: widget.hobbiesPlaceholder,
              onSaveResume: widget.onSaveResume,
              mode: widget.mode,
              data: widget.data ?? Str.mockData,
            );
          case TemplateType.technicalResume:
            return LayoutTechnical(
              h: h,
              w: w,
              height: widget.height,
              width: widget.width,
              showButtons: widget.showButtons,
              imageBoxFit: widget.imageBoxFit,
              imageHeight: widget.imageHeight,
              imageRadius: widget.imageRadius,
              imageWidth: widget.imageWidth,
              educationPlaceHolder: widget.educationPlaceHolder,
              enableDividers: widget.enableDivider,
              backgroundColor: widget.backgroundColor,
              emailPlaceHolder: widget.emailPlaceHolder,
              aboutMePlaceholder: widget.aboutMePlaceholder,
              experiencePlaceHolder: widget.experiencePlaceHolder,
              maxLinesExperience: widget.maxLinesExperience,
              telPlaceHolder: widget.telPlaceHolder,
              languagePlaceHolder: widget.languagePlaceHolder,
              hobbiesPlaceholder: widget.hobbiesPlaceholder,
              onSaveResume: widget.onSaveResume,
              mode: widget.mode,
              data: widget.data ?? Str.mockData,
            );
          case TemplateType.businessResume:
            return LayoutBusiness(
              h: h,
              w: w,
              height: widget.height,
              width: widget.width,
              showButtons: widget.showButtons,
              imageBoxFit: widget.imageBoxFit,
              imageHeight: widget.imageHeight,
              imageRadius: widget.imageRadius,
              imageWidth: widget.imageWidth,
              educationPlaceHolder: widget.educationPlaceHolder,
              enableDividers: widget.enableDivider,
              backgroundColor: widget.backgroundColor,
              emailPlaceHolder: widget.emailPlaceHolder,
              aboutMePlaceholder: widget.aboutMePlaceholder,
              experiencePlaceHolder: widget.experiencePlaceHolder,
              maxLinesExperience: widget.maxLinesExperience,
              telPlaceHolder: widget.telPlaceHolder,
              languagePlaceHolder: widget.languagePlaceHolder,
              hobbiesPlaceholder: widget.hobbiesPlaceholder,
              onSaveResume: widget.onSaveResume,
              mode: widget.mode,
              data: widget.data ?? Str.mockData,
            );
          case TemplateType.none:
            if (widget.onEmpty != null) {
              return widget.onEmpty!(context);
            } else {
              return LayoutBusiness(
                h: h,
                w: w,
                height: widget.height,
                width: widget.width,
                showButtons: widget.showButtons,
                imageBoxFit: widget.imageBoxFit,
                imageHeight: widget.imageHeight,
                imageRadius: widget.imageRadius,
                imageWidth: widget.imageWidth,
                educationPlaceHolder: widget.educationPlaceHolder,
                enableDividers: widget.enableDivider,
                backgroundColor: widget.backgroundColor,
                emailPlaceHolder: widget.emailPlaceHolder,
                aboutMePlaceholder: widget.aboutMePlaceholder,
                experiencePlaceHolder: widget.experiencePlaceHolder,
                maxLinesExperience: widget.maxLinesExperience,
                telPlaceHolder: widget.telPlaceHolder,
                languagePlaceHolder: widget.languagePlaceHolder,
                hobbiesPlaceholder: widget.hobbiesPlaceholder,
                onSaveResume: widget.onSaveResume,
                mode: widget.mode,
                data: widget.data ?? Str.mockData,
              );
            }
        }
      }),
    );
  }
}
