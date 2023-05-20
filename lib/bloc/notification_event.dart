part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class NotificationOpened extends NotificationEvent {
  const NotificationOpened({required this.notification});

  final Notification notification;

  @override
  List<Object> get props => [notification];
}

class NotificationInForegroundReceived extends NotificationEvent {
  const NotificationInForegroundReceived({required this.notification});

  final Notification notification;

  @override
  List<Object> get props => [notification];
}
