import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lykke_mobile_mavn/app/resources/color_styles.dart';
import 'package:lykke_mobile_mavn/app/resources/image_assets.dart';
import 'package:lykke_mobile_mavn/app/resources/localized_strings.dart';
import 'package:lykke_mobile_mavn/app/resources/text_styles.dart';
import 'package:lykke_mobile_mavn/library_ui_components/buttons/custom_back_button.dart';

class ComingSoonPage extends HookWidget {
  const ComingSoonPage({this.title, this.hasBackButton = false});

  final String title;
  final bool hasBackButton;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorStyles.alabaster,
        appBar: AppBar(
          title: title != null
              ? Text(
                  title,
                  style: TextStyles.darkHeaderTitle,
                )
              : Container(),
          brightness: Brightness.light,
          backgroundColor: ColorStyles.alabaster,
          elevation: 0,
          leading: hasBackButton ? const CustomBackButton() : null,
        ),
        body: _buildContent(),
      );

  Widget _buildContent() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Column(
                children: <Widget>[
                  Image(
                      image: AssetImage(ImageAssets.comingSoon),
                      fit: BoxFit.contain),
                  AutoSizeText(
                    useLocalizedStrings().socialPageComingSoon,
                    style: TextStyles.darkHeadersH2,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
