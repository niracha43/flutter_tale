part of 'notification_bloc.dart';

enum NotificationStateStatus { initial, success, failure }

class NotificationState extends Equatable {
  final NotificationStateStatus status;
  final List<NotificationModel> notification;

  NotificationState(
      {this.status = NotificationStateStatus.initial,
      this.notification = const <NotificationModel>[]});

  NotificationState copyWith({
    NotificationStateStatus status,
    List<NotificationModel> notification,
  }) {
    return NotificationState(
      status: status ?? this.status,
      notification: notification ?? this.notification,
    );
  }

  @override
  List<Object> get props => [];
}
