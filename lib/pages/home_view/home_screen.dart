import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_flutter/pages/home_view/home_viewmodel.dart';
import 'package:stacked_architecture_flutter/resources/app_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      viewModel.navigateToScheduleView();
                    },
                    child: Text(
                      "scheduled view",
                      style: getMediumStyle(fontSize: 18.sp),
                    ),
                  ),
                  SizedBox(
                    height: 16.sp,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.navigateToActivityView();
                    },
                    child: Text(
                      "Activity view",
                      style: getMediumStyle(fontSize: 18.sp),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
