import 'package:calender/screens/calender_screen.dart';
import 'package:calender/widgets/card_slider.dart';
import 'package:calender/widgets/diary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calender/widgets/date_picker_widget.dart';
import 'package:calender/widgets/custom_tap.dart';
import 'package:flutter/widgets.dart';
import 'package:date_format/date_format.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selctedDate = DateTime.now();
  String formattedDate =
      formatDate(DateTime.now(), [dd, ' ', MM, ' ', hh, ':', mm]);

  var tabIndex = 0;

  void showDatePickerSheet() async {
    DateTime newValue = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => CalenderScreen()));
    setState(() {
      formattedDate = formatDate(newValue, [dd, ' ', MM, ' ', hh, ':', mm]);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(formattedDate,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ))),
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
              width: 390,
              height: 30,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(47)),
              child: TabBar(
                // isScrollable: true,
                onTap: (int index) {
                  setState(() {
                    tabIndex = index;
                  });
                },

                dividerColor: Colors.transparent,
                tabs: <Widget>[
                  CustomTab(
                    imageUrl: 'assets/icons/diary.png',
                    label: 'Дневник настроения',
                    isSelected: tabIndex == 0 ? true : false,
                  ),
                  CustomTab(
                    imageUrl: 'assets/icons/stat.png',
                    label: 'Статистика',
                    isSelected: tabIndex == 1 ? true : false,
                  ),
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
