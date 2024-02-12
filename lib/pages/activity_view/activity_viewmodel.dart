import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_flutter/app/app.locator.dart';
import 'package:stacked_architecture_flutter/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class ActivityViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>;

  void goTOHome() {
    navigationService().navigateToHomeScreen();
  }
}
