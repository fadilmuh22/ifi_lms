import 'package:flutter/material.dart';
import 'package:ifi_lms/models/api_response_model.dart';
import 'package:ifi_lms/widgets/schedule_calendar.dart';
import 'package:intl/intl.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ifi_lms/models/schedule_model.dart';
import 'package:ifi_lms/providers/schedule_provider.dart';
import 'package:ifi_lms/util/colors.dart';

class ScheduleScreen extends ConsumerWidget {
  final TabController tabController;
  const ScheduleScreen({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduleApi = ref.read(scheduleApiProvider);
    final scheduleData = ref.read(scheduleProvider);
    return TabBarView(
      controller: tabController,
      children: [
        ScheduleCalendar(UniqueKey()),
        SchedulesBulan(listSchedule: scheduleData),
        // SchedulesHari(listSchedule: scheduleData)
      ],
    );
  }
}

class SchedulesBulan extends StatelessWidget {
  final List<ScheduleModel> listSchedule;
  const SchedulesBulan({Key? key, required this.listSchedule})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        const SizedBox(height: 21),
        // TableCalendar(
        //   firstDay: DateTime.utc(2010, 10, 16),
        //   lastDay: DateTime.utc(2030, 3, 14),
        //   focusedDay: DateTime.now(),
        // ),
        // const SizedBox(height: 32),
        _jadwalBulanListTile(context, true, DateTime.now(), ScheduleModel()),
        _jadwalBulanListTile(context, false, DateTime.now(), ScheduleModel()),
      ],
    );
  }
}

class SchedulesHari extends StatelessWidget {
  final List<ScheduleModel> listSchedule;
  const SchedulesHari({Key? key, required this.listSchedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future(() {}),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ApiResponseModel response =
              ApiResponseModel.fromJson(snapshot.data as Map<String, dynamic>);

          if (response.status != 200) {
            return Container();
          }

          response.data = (response.data as List<Map<String, dynamic>>)
              .map((data) => ScheduleModel.fromJson(data))
              .toList();

          listSchedule.clear();
          listSchedule.addAll(response.data);

          return ListView(
            children: const [],
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

Widget _jadwalBulanListTile(
    BuildContext context, bool active, DateTime date, ScheduleModel schedule) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 23),
    decoration: BoxDecoration(
        color: active ? ColorsUtil.inversePrimary : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: active
            ? null
            : Border.all(
                width: 1,
                color: ColorsUtil.gray,
              ),
        boxShadow: !active
            ? null
            : [
                BoxShadow(
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                  color: const Color(0xFFB0B0B0).withOpacity(.5),
                ),
              ]),
    child: Row(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: active ? Colors.white : ColorsUtil.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    DateFormat('d').format(date),
                    style: TextStyle(
                      color:
                          active ? ColorsUtil.inversePrimary : ColorsUtil.font,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat('E').format(date),
                    style: TextStyle(
                      color:
                          active ? ColorsUtil.inversePrimary : ColorsUtil.font,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
            SizedBox(
              width: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '[Grade 31]\nSurface & Structure of Fabric',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: active
                          ? Theme.of(context).colorScheme.onPrimary
                          : ColorsUtil.font,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'on going',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.normal,
                          color: active
                              ? Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(.5)
                              : ColorsUtil.font.withOpacity(.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
