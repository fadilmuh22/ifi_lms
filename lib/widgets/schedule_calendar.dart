import 'dart:math';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ifi_lms/util/colors.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarColors {
  static Color backgroundColor = Colors.white;
  static Color cardThemeColor = Colors.white;
  static Color textColor = Colors.black;
  static Color bottomSheetBackgroundColor = ColorsUtil.tertiary;
}

/// Widget of getting started calendar
class ScheduleCalendar extends StatefulWidget {
  /// Creates default getting started calendar
  const ScheduleCalendar(Key key) : super(key: key);

  @override
  ScheduleCalendarState createState() => ScheduleCalendarState();
}

/// Represents the state class of  ScheduleCalendarState
class ScheduleCalendarState extends State<ScheduleCalendar> {
  /// Creates an instance of  ScheduleCalendarState state
  ScheduleCalendarState();

  final List<String> _subjectCollection = <String>[];
  final List<Color> _colorCollection = <Color>[];
  final _MeetingDataSource _events = _MeetingDataSource(<_Meeting>[]);
  final DateTime _minDate =
          DateTime.now().subtract(const Duration(days: 365 ~/ 2)),
      _maxDate = DateTime.now().add(const Duration(days: 365 ~/ 2));

  final List<CalendarView> _allowedViews = <CalendarView>[
    CalendarView.day,
    CalendarView.week,
    CalendarView.workWeek,
    CalendarView.timelineDay,
    CalendarView.timelineWeek,
    CalendarView.timelineWorkWeek,
    CalendarView.month,
    CalendarView.schedule
  ];

  /// Global key used to maintain the state, when we change the parent of the
  /// widget
  final GlobalKey _globalKey = GlobalKey();
  final ScrollController _controller = ScrollController();
  final CalendarController _calendarController = CalendarController();

  List<DateTime> _blackoutDates = <DateTime>[];
  final bool _showLeadingAndTrailingDates = true;
  final bool _showDatePickerButton = true;
  final bool _allowViewNavigation = true;
  final bool _showCurrentTimeIndicator = true;

  final ViewNavigationMode _viewNavigationMode = ViewNavigationMode.snap;
  final bool _showWeekNumber = false;
  final int _numberOfDays = -1;

  @override
  void initState() {
    _calendarController.view = CalendarView.week;
    addAppointmentDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget calendar = Theme(

        /// The key set here to maintain the state,
        ///  when we change the parent of the widget
        key: _globalKey,
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(secondary: CalendarColors.backgroundColor),
        ),
        child: _getScheduleCalendar(_calendarController, _events,
            _onViewChanged, _minDate, _maxDate, scheduleViewBuilder));

    final double screenHeight = MediaQuery.of(context).size.height;
    return Row(children: <Widget>[
      Expanded(
        child: Container(color: CalendarColors.cardThemeColor, child: calendar),
      )
    ]);
  }

  /// The method called whenever the calendar view navigated to previous/next
  /// view or switched to different calendar view, based on the view changed
  /// details new appointment collection added to the calendar
  void _onViewChanged(ViewChangedDetails visibleDatesChangedDetails) {
    final List<_Meeting> appointment = <_Meeting>[];
    final Random random = Random();
    final List<DateTime> blockedDates = <DateTime>[];
    if (_calendarController.view == CalendarView.month ||
        _calendarController.view == CalendarView.timelineMonth) {
      for (int i = 0; i < 5; i++) {
        blockedDates.add(visibleDatesChangedDetails.visibleDates[
            random.nextInt(visibleDatesChangedDetails.visibleDates.length)]);
      }
    }

    SchedulerBinding.instance?.addPostFrameCallback((Duration timeStamp) {
      setState(() {
        if (_calendarController.view == CalendarView.month ||
            _calendarController.view == CalendarView.timelineMonth) {
          _blackoutDates = blockedDates;
        } else {
          _blackoutDates.clear();
        }
      });
    });

    /// Creates new appointment collection based on
    /// the visible dates in calendar.
    for (int i = 0; i < visibleDatesChangedDetails.visibleDates.length; i++) {
      final DateTime date = visibleDatesChangedDetails.visibleDates[i];
      if (blockedDates.isNotEmpty && blockedDates.contains(date)) {
        continue;
      }
      final int count = 1 + random.nextInt(false ? 2 : 3);
      for (int j = 0; j < count; j++) {
        final DateTime startDate = DateTime(
            date.year, date.month, date.day, 8 + random.nextInt(8), 0, 0);
        int indexSchedule = random.nextInt(5);
        appointment.add(_Meeting(
          _subjectCollection[indexSchedule],
          startDate,
          startDate.add(Duration(hours: random.nextInt(3))),
          _colorCollection[indexSchedule],
          false,
        ));
      }
    }

    for (int i = 0; i < appointment.length; i++) {
      _events.appointments.add(appointment[i]);
    }

    /// Resets the newly created appointment collection to render
    /// the appointments on the visible dates.
    _events.notifyListeners(CalendarDataSourceAction.reset, appointment);
  }

  /// Creates the required appointment details as a list.
  void addAppointmentDetails() {
    _subjectCollection.add('Open');
    _subjectCollection.add('Ongoing');
    _subjectCollection.add('Finished');
    _subjectCollection.add('Postponed');
    _subjectCollection.add('Event');

    _colorCollection.add(const Color(0xFF3D4FB5));
    _colorCollection.add(const Color(0xFF0F8644));
    _colorCollection.add(const Color(0xFF01A1EF));
    _colorCollection.add(const Color(0xFF636363));
    _colorCollection.add(const Color(0xFFD20100));
  }

  /// Returns the calendar widget based on the properties passed.
  SfCalendar _getScheduleCalendar(
      [CalendarController? _calendarController,
      CalendarDataSource? _calendarDataSource,
      ViewChangedCallback? viewChangedCallback,
      DateTime? _minDate,
      DateTime? _maxDate,
      dynamic scheduleViewBuilder]) {
    return SfCalendar(
      controller: _calendarController,
      dataSource: _calendarDataSource,
      allowedViews: _allowedViews,
      scheduleViewMonthHeaderBuilder: scheduleViewBuilder,
      showNavigationArrow: false,
      showDatePickerButton: _showDatePickerButton,
      allowViewNavigation: _allowViewNavigation,
      showCurrentTimeIndicator: _showCurrentTimeIndicator,
      onViewChanged: viewChangedCallback,
      blackoutDates: _blackoutDates,
      blackoutDatesTextStyle: const TextStyle(
          decoration: false ? null : TextDecoration.lineThrough,
          color: Colors.red),
      minDate: _minDate,
      maxDate: _maxDate,
      monthViewSettings: MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          showTrailingAndLeadingDates: _showLeadingAndTrailingDates,
          appointmentDisplayCount: 4),
      timeSlotViewSettings: TimeSlotViewSettings(
          numberOfDaysInView: _numberOfDays,
          minimumAppointmentDuration: const Duration(minutes: 60)),
      viewNavigationMode: _viewNavigationMode,
      showWeekNumber: _showWeekNumber,
    );
  }
}

/// Returns the builder for schedule view.
Widget scheduleViewBuilder(
    BuildContext buildContext, ScheduleViewMonthHeaderDetails details) {
  final String monthName = DateFormat('MMMM').format(details.date);
  return Stack(
    children: <Widget>[
      Image(
          image: ExactAssetImage('images/' + monthName + '.png'),
          fit: BoxFit.cover,
          width: details.bounds.width,
          height: details.bounds.height),
      Positioned(
        left: 55,
        right: 0,
        top: 20,
        bottom: 0,
        child: Text(
          monthName + ' ' + details.date.year.toString(),
          style: const TextStyle(fontSize: 18),
        ),
      )
    ],
  );
}

/// An object to set the appointment collection data source to collection, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class _MeetingDataSource extends CalendarDataSource<_Meeting> {
  _MeetingDataSource(this.source);

  List<_Meeting> source;

  @override
  List<dynamic> get appointments => source;

  @override
  DateTime getStartTime(int index) {
    return source[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return source[index].to;
  }

  @override
  bool isAllDay(int index) {
    return source[index].isAllDay;
  }

  @override
  String getSubject(int index) {
    return source[index].eventName;
  }

  @override
  Color getColor(int index) {
    return source[index].background;
  }

  @override
  _Meeting convertAppointmentToObject(
      _Meeting eventName, Appointment appointment) {
    return _Meeting(appointment.subject, appointment.startTime,
        appointment.endTime, appointment.color, appointment.isAllDay);
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class _Meeting {
  _Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
