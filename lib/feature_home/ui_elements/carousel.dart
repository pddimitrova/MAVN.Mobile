import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lykke_mobile_mavn/app/resources/color_styles.dart';

typedef CarouselItemBuilder<T, W extends Widget> = W Function(T item);

class Carousel<T, W> extends HookWidget {
  const Carousel({
    @required this.dataSet,
    @required this.itemBuilder,
  });

  final List<T> dataSet;
  final CarouselItemBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    ///set [initialIndex] at the middle of the [dataSet]
    final initialIndex = (dataSet.length / 2).floor();
    final currentIndex = useState<int>(initialIndex);

    return Column(
      children: <Widget>[
        CarouselSlider(
          items: dataSet.map((item) => itemBuilder(item)).toList(),
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            aspectRatio: 2,
            initialPage: initialIndex,
            onPageChanged: (index, reason) => currentIndex.value = index,
          ),
        ),
        _buildIndicator(currentIndex.value),
      ],
    );
  }

  ///Builds the position indicator at the bottom
  Widget _buildIndicator(int currentIndex) => Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dataSet
              .map((item) =>
                  _buildIndicatorItem(currentIndex == dataSet.indexOf(item)))
              .toList(),
        ),
      );

  ///Builds a single position indicator for the bottom position indicator
  Widget _buildIndicatorItem(bool isCurrentIndex) => Container(
        width: 16,
        height: 4,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          shape: BoxShape.rectangle,
          color: isCurrentIndex
              ? ColorStyles.resolutionBlue
              : ColorStyles.darkMercury,
        ),
      );
}
