import 'package:app_ponto/app/shared/utils/AppPalette.dart';
import 'package:app_ponto/app/modules/home/components/person_details.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const PersonDetails(),
        Card(
          elevation: 0,
          child: Column(
            children: [
              _calendarHome(),
              _tababarButton(),
              _tababarContainer(),
            ],
          ),
        )
      ],
    );
  }

  Widget _tababarContainer() {
    return LayoutBuilder(
      builder: (_, constraints) => SizedBox(
        height: 400,
        child: TabBarView(
          controller: tabController,
          children: [
            Container(
              width: constraints.maxWidth,
              color: AppPalette.white,
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: .5,
                                color: AppPalette.black38.withOpacity(.1)))),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      "14 de março de 2023",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppPalette.black87,
                          fontSize: 12),
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      "Ultimo registro de ponto",
                      style: TextStyle(fontSize: 12, color: AppPalette.black38),
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "08:30",
                          style: TextStyle(
                              fontSize: 16,
                              color: AppPalette.black87,
                              fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_forward,
                              size: 12, color: AppPalette.black38),
                        ),
                        Text(
                          "12:00",
                          style: TextStyle(
                              fontSize: 16,
                              color: AppPalette.black87,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    width: constraints.maxWidth,
                    padding:
                        const EdgeInsets.only(left: 12, right: 12, top: 12),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                width: .5,
                                color: AppPalette.black38.withOpacity(.1)))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.access_time,
                            size: 15,
                          ),
                          Icon(
                            Icons.more_time_rounded,
                            size: 15,
                          ),
                          Icon(
                            Icons.timer_sharp,
                            size: 15,
                          ),
                        ]),
                  )
                ],
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }

  Container _tababarButton() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: TabBar(
        controller: tabController,
        labelColor: AppPalette.primaria,
        tabs: const [
          Padding(padding: EdgeInsets.all(8.0), child: Text("SAMU")),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("UBS Santa Maria"),
          )
        ],
      ),
    );
  }

  Widget _infoCard({required String title, required String value}) {
    return Container(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black54),
          ),
          Text(value, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  TableCalendar<dynamic> _calendarHome() {
    return TableCalendar(
      locale: 'pt_BR',
      calendarFormat: CalendarFormat.week,
      firstDay: DateTime.utc(2010, 10, 20),
      lastDay: DateTime.utc(2040, 10, 20),
      focusedDay: DateTime.now(),
      headerStyle: const HeaderStyle(
          leftChevronVisible: true,
          rightChevronVisible: true,
          formatButtonVisible: false,
          formatButtonShowsNext: false,
          titleCentered: true),
    );
  }
}
