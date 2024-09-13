import 'package:calender/widgets/card_slider.dart';
import 'package:calender/widgets/diary.dart';
import 'package:calender/widgets/emotions_row.dart';
import 'package:calender/widgets/page_switcher.dart';
import 'package:calender/widgets/subemotion_button.dart';
import 'package:calender/widgets/subemotions_toggle_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calender/widgets/date_picker_sheet.dart';
import 'package:calender/widgets/custom_tap.dart';
import 'package:flutter/widgets.dart';
import 'package:date_format/date_format.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void showDatePickerSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) => DatePickerSheet());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate =
        formatDate(DateTime.now(), [dd, ' ', MM, ' ', hh, ':', mm]);
    return DefaultTabController(
      // initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(formattedDate)),
          actions: [
            IconButton(
                onPressed: () {
                  showDatePickerSheet();
                },
                icon: const Icon(Icons.calendar_month_rounded))
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20.0),
            child: Container(
              width: 320,
              height: 30,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(47)),
              child: const TabBar(
                isScrollable: true,
                dividerColor: Colors.transparent,
                tabs: <Widget>[
                  CustomTab(
                    imageUrl: 'assets/icons/diary.png',
                    label: 'Дневник настроения',
                  ),
                  CustomTab(
                      imageUrl: 'assets/icons/stat.png', label: 'Статистика'),
                ],
                indicator: BoxDecoration(),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Diary(),
            ),
            Center(
              child: Image.asset('assets/icons/stat.png'),
            ),
          ],
        ),
      ),
    );
  }
}
