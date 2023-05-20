part of 'notification_bloc.dart';

enum AppState {
  background,
  foreground;

  bool get isBackground => this == AppState.background;
  bool get isForeground => this == AppState.foreground;
}

class NotificationState {
  const NotificationState({
    this.notification,
    this.appState,
  });

  const NotificationState.initial() : this();

  final Notification? notification;
  final AppState? appState;

  NotificationState copyWith({
    Notification? notification,
    AppState? appState,
  }) {
    return NotificationState(
      notification: notification ?? this.notification,
      appState: appState ?? this.appState,
    );
  }
}
