import 'package:app_ponto/app/shared/utils/AppPalette.dart';
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
        _detailsPerson(),
        Card(
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

  SizedBox _tababarContainer() {
    return SizedBox(
      height: 400,
      child: TabBarView(
        controller: tabController,
        children: [
          Container(),
          Container(),
        ],
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

  Container _detailsPerson() {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: ListTile(
            leading: const SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
              ),
            ),
            title: const Text("Maria da Silva"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("maria_s21@gmail.com"),
                Text("Escala: XXXX"),
              ],
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
