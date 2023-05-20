import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_module/notification_module.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc({required NotificationModule notificationModule})
      : _notificationModule = notificationModule,
        super(const NotificationState.initial()) {
    on<NotificationOpened>(_onNotificationOpened);
    on<NotificationInForegroundReceived>(_onNotificationInForegroundReceived);

    _notificationModule.onNotificationOpened.listen((notification) {
      add(NotificationOpened(notification: notification));
    });

    _notificationModule.onForegroundNotification.listen(
      (notification) {
        add(NotificationOpened(notification: notification));
      },
    );
  }

  final NotificationModule _notificationModule;

  void _onNotificationOpened(
    NotificationOpened event,
    Emitter<NotificationState> emit,
  ) {
    emit(
      state.copyWith(
        notification: event.notification,
        appState: AppState.background,
      ),
    );
  }

  void _onNotificationInForegroundReceived(
    NotificationInForegroundReceived event,
    Emitter<NotificationState> emit,
  ) {
    emit(
      state.copyWith(
        notification: event.notification,
        appState: AppState.foreground,
      ),
    );
  }
}
