// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/helpers/allController.dart';
import 'package:enayas_app/services/helpers/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cachedNetwork/cachedNetworkWidget.dart';

class SliderWidget extends StatefulWidget {
  final double? sliderHeight;
  BorderRadiusGeometry? borderRadius = BorderRadius.zero;

  SliderWidget({
    this.sliderHeight,
    this.borderRadius,
  });
  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int? _indicatorCount = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AllController.sliderC.isLoading.value == true
          ? loadingAnimation()
          : Column(
              children: [
                SizedBox(
                  height: widget.sliderHeight ?? 180,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CarouselSlider.builder(
                        itemCount: AllController
                            .sliderC.mainSliderList.value.data!.length,
                        itemBuilder: (
                          BuildContext context,
                          int itemIndex,
                          int pageViewIndex,
                        ) {
                          final item = AllController
                              .sliderC.mainSliderList.value.data![itemIndex];
                          return Stack(
                            children: [
                              Container(
                                height: widget.sliderHeight ?? 180,
                                width: Get.width,
                                child: ClipRRect(
                                  // borderRadius: widget.borderRadius,
                                  child: CachedNetworkImageWidget(
                                    imageUrl: item.photo.toString(),
                                    fit: BoxFit.cover,
                                    height: widget.sliderHeight,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        options: CarouselOptions(
                          height: widget.sliderHeight,
                          // aspectRatio: 16 / 9,
                          viewportFraction: 1.5,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          onPageChanged: (_, i) {
                            // print('Slider Index : $_');
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
                              itemCount: AllController
                                  .sliderC.mainSliderList.value.data!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (c, i) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 3),
                                  child: _indicatorCount == i
                                      ? Container(
                                          // height: 6,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
            ),
    );
  }
}
