import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_project/models/notification_model.dart';
import 'package:mobile_project/service/storyteller_bord.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationState());
  @override
  void onEvent(NotificationEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onChange(Change<NotificationState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onTransition(
      Transition<NotificationEvent, NotificationState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }

  @override
  Stream<NotificationState> mapEventToState(
    NotificationEvent event,
  ) async* {
    if (event is NotificationEvent) {
      yield state.copyWith(status: NotificationStateStatus.initial);
      try {
        List<NotificationModel> _notificationList =
            await TellerService().getNotificationList();
        yield _notificationList.isEmpty
            ? state.copyWith(notification: [])
            : state.copyWith(
                status: NotificationStateStatus.success,
                notification: _notificationList,
              );
      } on Exception {
        yield state.copyWith(
          status: NotificationStateStatus.failure,
          notification: [],
        );
      }
    }
  }
}
