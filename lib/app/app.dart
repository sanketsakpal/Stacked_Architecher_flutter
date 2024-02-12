import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture_flutter/app/services/api_service.dart';
import 'package:stacked_architecture_flutter/pages/activity_view/activity_view.dart';
import 'package:stacked_architecture_flutter/pages/home_view/home_screen.dart';
import 'package:stacked_architecture_flutter/pages/schedule_view/scheduled_view.dart';
import 'package:stacked_architecture_flutter/app/services/activity_service.dart';
import 'package:stacked_architecture_flutter/app/services/scheduled_service.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeScreen, initial: true),
    MaterialRoute(page: ScheduledView),
    MaterialRoute(page: ActivityView)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ScheduleService),
    LazySingleton(classType: ActivityService),
    LazySingleton(classType: ApiService)
  ],
)
class AppSetup {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
