import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// styles
import '../style/style.dart';

class Page {
  int year;
  int month;
  List<DateTime> dates = [];

  Page({required this.year, required this.month}) {
    dates = getDates();
  }

  List<DateTime> getDates() {
    DateTime pointer = DateTime(year, month);
    List<DateTime> days = [];
    while (pointer.month == month) {
      days.add(pointer);
      pointer = pointer.add(const Duration(days: 1));
    }
    return days;
  }

  DateTime dateTime() {
    return DateTime(year, month);
  }

  DateTime nextMonth() {
    if (month == 12) {
      return DateTime(year + 1, 1);
    }

    return DateTime(year, month + 1);
  }

  DateTime previousMonth() {
    if (month == 1) {
      return DateTime(year - 1, 12);
    }

    return DateTime(year, month - 1);
  }
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  late PageController _slideController;

  final ValueNotifier<DateTime> _currentMonth = ValueNotifier(DateTime.now());
  List<Page> _pages = [];

  void generateCalendarDates({String? type, int? year}) {
    year ??= DateTime.now().year;
    type ??= 'next';

    DateTime start = DateTime(year);
    //DateTime end = DateTime(DateTime.now().year + 1);
    List<Page> page = [];

    int month = 1;
    while (month != 13) {
      page.add(Page(year: start.year, month: month));
      month++;
    }

    if (type == 'next') {
      _pages.addAll(page);
    }

    if (type == 'previous') {
      _pages.insertAll(0, page);
    }
  }

  @override
  void initState() {
    _slideController = PageController();
    _slideController.addListener(() {
      int indexPage = _slideController.page!.floor();

      _currentMonth.value =
          DateTime(_pages[indexPage].year, _pages[indexPage].month);
      // next
      if (indexPage == (_pages.length - 1)) {
        setState(() {
          generateCalendarDates(year: _pages[indexPage].year + 1);
        });
        _slideController.jumpToPage(_pages.length - 11);
      }
      // previous
      if (indexPage == 0) {
        setState(() {
          generateCalendarDates(
              type: 'previous', year: _pages[indexPage].year - 1);
        });
        _slideController.jumpToPage(12);
      }
    });

    generateCalendarDates();
    generateCalendarDates(type: 'previous', year: _currentMonth.value.year - 1);
    generateCalendarDates(year: _currentMonth.value.year + 1);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      int index = 0;
      while (true) {
        int compare = _pages[index].dateTime().compareTo(
            DateTime(_currentMonth.value.year, _currentMonth.value.month));
        if (compare == 0) {
          _slideController.jumpToPage(index);
          break;
        }
        index++;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ValueListenableBuilder<DateTime>(
                valueListenable: _currentMonth,
                builder: (context, value, child) {
                  return Text(
                    style: h2,
                    DateFormat('MMM yyyy')
                        .format(_currentMonth.value)
                        .toString(),
                  );
                },
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      _slideController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                    },
                    child: const Icon(
                      size: 40.0,
                      Icons.arrow_left,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _slideController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                    },
                    child: const Icon(
                      size: 40.0,
                      Icons.arrow_right,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 225,
            child: PageView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _slideController,
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 7,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  children: [
                    for (int x = 0; x < _pages[index].dates.length; x++)
                      InkWell(
                        onTap: () {},
                        child: Stack(
                          children: [
                            if (false)
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            Center(
                              child: Text(
                                style: true
                                    ? null
                                    : const TextStyle(
                                        color: Colors.white,
                                      ),
                                _pages[index].dates[x].day.toString(),
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
