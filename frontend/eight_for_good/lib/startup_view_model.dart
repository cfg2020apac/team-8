import 'package:eight_for_good/push_notification_service.dart';
import 'main.dart';


class StartUpViewModel extends MyApp {
  final PushNotificationService pushNotificationService = PushNotificationService();

  Future handleStartUpLogic() async {
    await pushNotificationService.intialise();
  }

}