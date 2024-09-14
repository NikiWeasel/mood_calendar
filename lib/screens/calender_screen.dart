import 'package:calender/widgets/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';

List<String> _weekDays = ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'];

class CalenderScreen extends StatefulWidget {
  CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    var selctedDateTime = DateTime.now();

    void setDateTime(DateTime dateTime) {
      selctedDateTime = dateTime;
    }

    final calendarController = CleanCalendarController(
        minDate: DateTime(2000, 1, 1),
        maxDate: DateTime.now().add(const Duration(days: 365)),
        initialFocusDate: DateTime.now(),
        initialDateSelected: DateTime.now(),
        rangeMode: false,
        weekdayStart: DateTime.monday,
        onDayTapped: (DateTime dateTime) {
          setDateTime(dateTime);
        });

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) return;
        Navigator.pop(context, selctedDateTime);
      },
      child: Scaffold(
        appBar: AppBar(
          // title: Text('Custom Back Button'),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    setDateTime(DateTime.now());
                  });
                },
                child: Text(
                  'Сегодня',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary),
                ))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (var day in _weekDays)
                    Text(day,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                            )),
                ],
              ),
            ),
            Expanded(
                child: DatePickerWidget(
              calendarController: calendarController,
            )),
          ],
        ),
      ),
    );
  }
}
