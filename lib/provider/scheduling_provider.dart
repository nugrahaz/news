import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:dicoding_news_app/helper/date_time_helper.dart';
import 'package:dicoding_news_app/util/background_service.dart';
import 'package:flutter/cupertino.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<bool> scheduleNews(bool value) async {
    _isScheduled = true;
    if (_isScheduled) {
      print('Scheduling News Activated');
      notifyListeners();
      return await AndroidAlarmManager.periodic(
          const Duration(hours: 24), 1, BackgroundService.callback,
          startAt: DateTimeHelper.format(), exact: true, wakeup: true);
    } else {
      print('Scheduling News Canceled');
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
