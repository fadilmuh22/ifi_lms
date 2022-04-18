import 'package:ifi_lms/api/schedule_api.dart';
import 'package:ifi_lms/models/schedule_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final scheduleProvider =
    StateNotifierProvider<ScheduleData, List<ScheduleModel>>((ref) {
  return ScheduleData([]);
});

final scheduleApiProvider = Provider((ref) => ScheduleApi());

class ScheduleData extends StateNotifier<List<ScheduleModel>> {
  ScheduleData(List<ScheduleModel> initialSchedule) : super(initialSchedule);
}
