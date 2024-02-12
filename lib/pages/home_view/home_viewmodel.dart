import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_flutter/app/app.locator.dart';
import 'package:stacked_architecture_flutter/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>;

  navigateToScheduleView() {
    NavigationService().navigateToScheduledView();
  }

  navigateToActivityView() {
    NavigationService().navigateToActivityView();
  }
}
