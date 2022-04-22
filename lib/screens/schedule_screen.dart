import 'package:ifi_lms/screens/profile_screen.dart';
import 'package:ifi_lms/util/custom_icons.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:ifi_lms/models/api_response_model.dart';
import 'package:ifi_lms/widgets/schedule_calendar.dart';

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

dynamic createJadwalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(12),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    isDismissible: false,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 32,
                width: 169,
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFDAE2FF),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.white,
                  ),
                  labelColor: Theme.of(context).colorScheme.primary,
                  labelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelColor:
                      Theme.of(context).colorScheme.onBackground,
                  tabs: const [
                    Tab(
                      text: 'Jadwal',
                    ),
                    Tab(
                      text: 'Acara',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2 -
                                  3 -
                                  24,
                              height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mulai',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  const SizedBox(height: 4),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: '1/9/70',
                                      fillColor: ColorsUtil.secondary,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          CustomIcons.calendar,
                                          size: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 6),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2 -
                                  3 -
                                  24,
                              height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Berakhir',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  const SizedBox(height: 4),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: '1/1/1970',
                                      fillColor: ColorsUtil.secondary,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          CustomIcons.calendar,
                                          size: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 23,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorsUtil.secondary,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  focusColor: ColorsUtil.gray,
                                  underline: Container(),
                                  hint: Text(
                                    'Pilih Material',
                                    style: TextStyle(
                                      color: ColorsUtil.font.withOpacity(.5),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  items: <String>['A', 'B', 'C', 'D']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (_) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 23,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorsUtil.secondary,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  focusColor: ColorsUtil.gray,
                                  underline: Container(),
                                  hint: Text(
                                    'Pilih Batch',
                                    style: TextStyle(
                                      color: ColorsUtil.font.withOpacity(.5),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  items: <String>['A', 'B', 'C', 'D']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (_) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 23,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorsUtil.secondary,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  focusColor: ColorsUtil.gray,
                                  underline: Container(),
                                  hint: Text(
                                    'Pilih Kelas',
                                    style: TextStyle(
                                      color: ColorsUtil.font.withOpacity(.5),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  items: <String>['A', 'B', 'C', 'D']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (_) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 42),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            cancelButton(context),
                            const SizedBox(width: 12),
                            submitButton(context),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nama',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Nama Acara',
                                  fillColor: ColorsUtil.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deskripsi',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Deskripsi Acara',
                                  fillColor: ColorsUtil.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2 -
                                  3 -
                                  24,
                              height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mulai',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  const SizedBox(height: 4),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: '1/9/70',
                                      fillColor: ColorsUtil.secondary,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          CustomIcons.calendar,
                                          size: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 6),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2 -
                                  3 -
                                  24,
                              height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Berakhir',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  const SizedBox(height: 4),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: '1/1/1970',
                                      fillColor: ColorsUtil.secondary,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          CustomIcons.calendar,
                                          size: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 42),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            cancelButton(context),
                            const SizedBox(width: 12),
                            submitButton(context),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

Widget _jadwalBulanListTile(
    BuildContext context, bool active, DateTime date, ScheduleModel schedule) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
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
            ],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        splashColor: ColorsUtil.primaryContainer.withOpacity(.5),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 23),
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
                            color: active
                                ? ColorsUtil.inversePrimary
                                : ColorsUtil.font,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('E').format(date),
                          style: TextStyle(
                            color: active
                                ? ColorsUtil.inversePrimary
                                : ColorsUtil.font,
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
        ),
      ),
    ),
  );
}
