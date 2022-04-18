import 'package:dio/dio.dart';

import 'package:ifi_lms/api/base_api.dart';
import 'package:ifi_lms/models/schedule_model.dart';

class ScheduleApi {
  final BaseApi api = BaseApi();

  Future getSchedules() async {
    return await api.dio.get('/schedules');
  }

  Future getSchedule(int id) async {
    return await api.dio.get('/schedule/$id');
  }

  Future createSchedule(ScheduleModel schedule) async {
    return await api.dio
        .post('/schedule', data: FormData.fromMap(schedule.toJson()));
  }
}
