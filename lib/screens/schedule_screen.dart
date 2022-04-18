import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ifi_lms/models/api_response_model.dart';
import 'package:ifi_lms/models/schedule_model.dart';
import 'package:ifi_lms/providers/schedule_provider.dart';

class ScheduleScreen extends ConsumerWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduleApi = ref.read(scheduleApiProvider);
    final scheduleData = ref.read(scheduleProvider);
    return FutureBuilder(
        future: Future(() {}),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ApiResponseModel response = ApiResponseModel.fromJson(
                snapshot.data as Map<String, dynamic>);

            if (response.status != 200) {
              return Container();
            }

            response.data = (response.data as List<Map<String, dynamic>>)
                .map((data) => ScheduleModel.fromJson(data))
                .toList();

            scheduleData.clear();
            scheduleData.addAll(response.data);

            return ListView(
              children: const [],
            );
          }

          return const CircularProgressIndicator();
        });
  }
}

class SchedulesList extends StatelessWidget {
  final List<ScheduleModel> listSchedule;
  const SchedulesList({Key? key, required this.listSchedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [],
    );
  }
}
