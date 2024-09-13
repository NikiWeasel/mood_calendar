import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class DatePickerSheet extends StatelessWidget {
  DatePickerSheet({super.key});

  final calendarController = CleanCalendarController(
    minDate: DateTime.now(),
    maxDate: DateTime.now().add(const Duration(days: 365)),
    onRangeSelected: (firstDate, secondDate) {},
    onDayTapped: (date) {},
    // readOnly: true,
    onPreviousMinDateTapped: (date) {},
    onAfterMaxDateTapped: (date) {},
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
    return Stack(
      children: [
        ScrollableCleanCalendar(
          calendarController: calendarController,
          layout: Layout.DEFAULT,
          locale: 'ru',
          // firstDay: DateTime.utc(2020, 1, 1),
          // lastDay: DateTime.utc(2030, 12, 31),
          // focusedDay: DateTime.now(),
          // calendarFormat: CalendarFormat.month, // можно менять формат
        ),
        // Positioned(
        //     bottom: MediaQuery.of(context).size.height - 50,
        //     child: Row(
        //       children: [
        //         IconButton(
        //           onPressed: () {},
        //           icon: Icon(
        //             Icons.close,
        //             color: Colors.red,
        //           ),
        //         ),
        //         const Spacer(),
        //         TextButton(onPressed: () {}, child: const Text('Сегодня'))
        //       ],
        //     ))
      ],
    );
  }
}
