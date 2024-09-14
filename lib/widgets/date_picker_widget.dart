import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class DatePickerWidget extends StatelessWidget {
  DatePickerWidget({super.key});

  final calendarController = CleanCalendarController(
    minDate: DateTime(2000, 1, 1),
    maxDate: DateTime.now().add(const Duration(days: 365)),
    initialFocusDate: DateTime.now(),
    initialDateSelected: DateTime.now(),

    // onRangeSelected: (firstDate, secondDate) {},
    rangeMode: false,
    // onDayTapped: (date) {},
    // // readOnly: true,
    // onPreviousMinDateTapped: (date) {},
    // onAfterMaxDateTapped: (date) {},
    weekdayStart: DateTime.monday,

    // initialFocusDate: DateTime(2023, 5),
    // initialDateSelected: DateTime(2022, 3, 15),
    // endDateSelected: DateTime(2022, 3, 20),
  );

  // IconButton(
  // onPressed: () {},
  // icon: Icon(
  // Icons.close,
  // color: Theme.of(context).colorScheme.primary,
  // ),
  // ),
  // const Spacer(),
  // TextButton(onPressed: () {}, child: const Text('Сегодня'))
  @override
  Widget build(BuildContext context) {
    return ScrollableCleanCalendar(
      monthBuilder: (context, weekday) {
        return Text('data');
      },
      dayTextStyle: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.bold),
      monthTextAlign: TextAlign.start,
      monthTextStyle: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(fontWeight: FontWeight.bold),
      calendarController: calendarController,
      showWeekdays: false,
      dayRadius: 34,
      daySelectedBackgroundColor: Color(0xFFDF7602).withOpacity(0.25),

      //background: #FF870240
      // weekdayBuilder: (context, weekday) => ,
      layout: Layout.DEFAULT,
      locale: 'ru',
    );
  }
}
