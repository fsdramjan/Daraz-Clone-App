import 'package:carousel_slider/carousel_slider.dart';
import 'package:enayas_app/services/configs/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cachedNetwork/cachedNetworkWidget.dart';

class SliderWidget extends StatefulWidget {
  final double? sliderHeight;
  SliderWidget({this.sliderHeight});
  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final sliderList = [
    'https://icms-image.slatic.net/images/ims-web/ac5a9829-a8d2-4ec9-9ef6-015a31898d9b.jpg_1200x1200.jpg',
    'https://icms-image.slatic.net/images/ims-web/50c244b9-34b2-4350-8222-2303ac7f6d8e.jpg',
    'https://icms-image.slatic.net/images/ims-web/ea583e6a-a68c-4e6c-8bbb-95a2837ec149.jpg',
  ];

  int? _indicatorCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.sliderHeight ?? 180,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider.builder(
                itemCount: sliderList.length,
                itemBuilder: (
                  BuildContext context,
                  int itemIndex,
                  int pageViewIndex,
                ) {
                  final item = sliderList[itemIndex];
                  return Stack(
                    children: [
                      Container(
                        height: widget.sliderHeight ?? 180,
                        width: Get.width,
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(6),
                          child: CachedNetworkImageWidget(
                            imageUrl: item.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                options: CarouselOptions(
                  height: 150,
                  // aspectRatio: 16 / 9,
                  viewportFraction: 1.5,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  onPageChanged: (_, i) {
                    print('Slider Index : $_');
                    setState(() {
                      _indicatorCount = _;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Positioned(
                bottom: 12,
                right: 0,
                left: 0,
                child: Container(
                  height: 6,
                  width: Get.width,
                  // color: AppColors.pink,
                  alignment: Alignment.center,
                  child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: sliderList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (c, i) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: _indicatorCount == i
                              ? Container(
                                  // height: 6,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.pink,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 4,
                                  backgroundColor:
                                      AppColors.grey100.withOpacity(.6),
                                ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
