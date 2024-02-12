// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_flutter/pages/activity_view/activity_viewmodel.dart';

import 'package:stacked_architecture_flutter/resources/app_colors.dart';
import 'package:stacked_architecture_flutter/resources/app_styles.dart';
import 'package:stacked_architecture_flutter/widgets/stacked_card.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ActivityViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.greenAccent,
              elevation: 0,
            ),
            body: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.greenAccent,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topLeft,
                    children: [
                      Positioned(
                        top: 30.h,
                        left: 20.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "My world",
                              style: getMediumStyle(
                                fontSize: 26.sp,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: Text(
                                "Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, .",
                                style: getMediumStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: GestureDetector(
                          onTap: () {
                            viewModel.goTOHome();
                          },
                          child: const Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.home,
                              size: 40,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                StackedCardCarousel(
                    type: StackedCardCarouselType.fadeOutStack,
                    spaceBetweenItems: 530,
                    initialOffset: 140,
                    items: const [
                      FancyCard(
                        color: Colors.white,
                        title: "Your numbers looks great",
                        description:
                            "Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, .",
                      ),
                      FancyCard(
                        color: Colors.orange,
                        title: "Your numbers looks great",
                        description:
                            "Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, .",
                      ),
                      FancyCard(
                        color: Colors.blue,
                        title: "Your numbers looks great",
                        description:
                            "Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, .",
                      ),
                      FancyCard(
                        color: Colors.redAccent,
                        title: "Your numbers looks great",
                        description:
                            "Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, .",
                      ),
                      FancyCard(
                        color: Colors.amberAccent,
                        title: "Your numbers looks great",
                        description:
                            "Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, .",
                      )
                    ]),
              ],
            ),
          );
        });
  }
}

class FancyCard extends StatelessWidget {
  const FancyCard({
    Key? key,
    required this.color,
    required this.title,
    required this.description,
  }) : super(key: key);

  final Color color;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(36.r),
        topRight: Radius.circular(36.r),
      )),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 650,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36.r),
                topRight: Radius.circular(36.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.transparent,
                              height: 180,
                              width: 180,
                              child: SfRadialGauge(
                                  enableLoadingAnimation: true,
                                  axes: <RadialAxis>[
                                    RadialAxis(
                                      minimum: 0,
                                      maximum: 100,
                                      startAngle: 20,
                                      endAngle: 330,
                                      radiusFactor: 0.8,
                                      annotations: const [
                                        GaugeAnnotation(
                                          positionFactor: 0.2,
                                          widget: Center(
                                            child: Text(
                                              '90%',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      showLabels: false,
                                      showTicks: false,
                                      axisLineStyle: AxisLineStyle(
                                        thickness: 0.2,
                                        cornerStyle: CornerStyle.bothCurve,
                                        color: Colors.orange.shade300,
                                        thicknessUnit: GaugeSizeUnit.factor,
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.transparent,
                              height: 180,
                              width: 180,
                              child: SfRadialGauge(
                                  enableLoadingAnimation: true,
                                  axes: <RadialAxis>[
                                    RadialAxis(
                                      minimum: 0,
                                      maximum: 100,
                                      startAngle: 20,
                                      endAngle: 330,
                                      radiusFactor: 0.8,
                                      annotations: const [
                                        GaugeAnnotation(
                                          positionFactor: 0.2,
                                          widget: Center(
                                            child: Text(
                                              '90%',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      showLabels: false,
                                      showTicks: false,
                                      axisLineStyle: AxisLineStyle(
                                        thickness: 0.2,
                                        cornerStyle: CornerStyle.bothCurve,
                                        color: Color(0xffbd9fa8),
                                        thicknessUnit: GaugeSizeUnit.factor,
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.transparent,
                              height: 180,
                              width: 180,
                              child: SfRadialGauge(
                                  enableLoadingAnimation: true,
                                  axes: <RadialAxis>[
                                    RadialAxis(
                                      minimum: 0,
                                      maximum: 100,
                                      startAngle: 20,
                                      endAngle: 330,
                                      radiusFactor: 0.8,
                                      annotations: const [
                                        GaugeAnnotation(
                                          positionFactor: 0.2,
                                          widget: Center(
                                            child: Text(
                                              '90%',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      showLabels: false,
                                      showTicks: false,
                                      axisLineStyle: const AxisLineStyle(
                                        thickness: 0.2,
                                        cornerStyle: CornerStyle.bothCurve,
                                        color:
                                            Color.fromARGB(255, 231, 127, 155),
                                        thicknessUnit: GaugeSizeUnit.factor,
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.transparent,
                              height: 180,
                              width: 180,
                              child: SfRadialGauge(
                                  enableLoadingAnimation: true,
                                  axes: <RadialAxis>[
                                    RadialAxis(
                                      minimum: 0,
                                      maximum: 100,
                                      startAngle: 20,
                                      endAngle: 330,
                                      radiusFactor: 0.8,
                                      annotations: const [
                                        GaugeAnnotation(
                                          positionFactor: 0.2,
                                          widget: Center(
                                            child: Text(
                                              '90%',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      showLabels: false,
                                      showTicks: false,
                                      axisLineStyle: const AxisLineStyle(
                                        thickness: 0.2,
                                        cornerStyle: CornerStyle.bothCurve,
                                        color: Color(0xff266289),
                                        thicknessUnit: GaugeSizeUnit.factor,
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    title,
                    style:
                        getBoldTextStyle(fontSize: 18.sp, color: Colors.pink),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.0,
                    child: Text(
                      description,
                      style: getRegularTextStyle(
                          fontSize: 16.sp, color: AppColors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
