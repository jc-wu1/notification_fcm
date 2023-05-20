import 'package:get_it/get_it.dart';
import 'package:notification_module/notification_module.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerSingleton<NotificationModule>(NotificationModule());
}
