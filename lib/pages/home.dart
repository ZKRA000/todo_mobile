import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// component
import '../components/event_tile.dart';

// functions
import '../functions/date_functions.dart';
import '../functions/widget_functions.dart';

// models
import '../models/easy_date.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int testing = 1;
  bool empty = false;
  final controller = ScrollController();
  final testingKey = GlobalKey();
  final dateTime = DateFormat('EEEE, d MMM y').format(DateTime.now());
  final month = DateFormat('E').format(DateTime.now());

  List<EasyDate> extraxtedDates = [];

  @override
  void initState() {
    super.initState();

    extraxtedDates = extractDateRange(
        DateTime(DateTime.now().year, DateTime.now().month, 1),
        DateTime(DateTime.now().year, DateTime.now().month + 1, 1));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final offset = getWidgetOffset(testingKey);

      if (offset != null) {
        controller.jumpTo(offset.dx > controller.position.maxScrollExtent
            ? controller.position.maxScrollExtent
            : offset.dx);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                          'Today',
                        ),
                        const SizedBox(height: 8),
                        Text(
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          dateTime,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                child: Row(
                  children: [
                    for (EasyDate x in extraxtedDates)
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE6E6E6),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(child: Text(x.day)),
                            ),
                            const SizedBox(height: 12),
                            Text(x.month)
                          ],
                        ),
                      ),
                    Container(
                      key: testingKey,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE6E6E6),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(child: Text('test')),
                          ),
                          const SizedBox(height: 12),
                          const Text('testing')
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          EventTile(),
                          EventTile(),
                          EventTile(),
                          EventTile(),
                        ],
                      ),
                    ),
                    if (empty)
                      Center(
                        child: Opacity(
                          opacity: 0.5,
                          child: Icon(
                            Icons.event_busy,
                            size: MediaQuery.of(context).size.width * 0.3,
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(4),
        height: 68,
        width: 68,
        child: RawMaterialButton(
          elevation: 0.0,
          textStyle: const TextStyle(
            color: Colors.white,
          ),
          fillColor: Colors.blue,
          shape: const CircleBorder(),
          onPressed: () {
            setState(() {
              extraxtedDates.insert(
                  0, const EasyDate('Wed', '1', 'Feb', '2023'));
              testing++;
            });
          },
          child: const Icon(
            size: 32,
            Icons.add,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 58,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      child: Icon(Icons.home),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      child: Icon(Icons.home),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      child: Icon(Icons.home),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      child: Icon(Icons.home),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
