import 'package:app_ponto/app/modules/home/pages/dashboard/dashboard_page.dart';
import 'package:app_ponto/app/modules/home/pages/profile/profile_page.dart';
import 'package:app_ponto/app/modules/home/pages/records/records_page.dart';
import 'package:app_ponto/app/modules/home/pages/scales/scales_page.dart';
import 'package:app_ponto/app/shared/utils/AppPalette.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  static const List<Widget> _pages = [
    DashboardPage(),
    RecordsPage(),
    ScalesPage(),
    ProfilePage(),
  ];
  static const List<String> _titlesPages = [
    "App Ponto",
    "Registros",
    "Escalas",
    "Perfil"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titlesPages.elementAt(_selectedPage),
        ),
        centerTitle: true,
        backgroundColor: AppPalette.primaria,
      ),
      body: _pages.elementAt(
        _selectedPage,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 70,
          margin: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buttonItenSelect(title: 'Home', icon: Icons.home, index: 0),
              _buttonItenSelect(
                  title: 'Registros', icon: Icons.add_chart_outlined, index: 1),
              const SizedBox.shrink(),
              _buttonItenSelect(title: 'Escalas', icon: Icons.book, index: 2),
              _buttonItenSelect(title: 'Perfil', icon: Icons.person, index: 3)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppPalette.primaria,
        onPressed: () {},
        child: const Icon(Icons.fingerprint),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buttonItenSelect({
    required String title,
    required IconData icon,
    required int index,
  }) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      onPressed: () => _nextPage(index),
      icon: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Icon(
            icon,
            color: _selectedPage == index
                ? AppPalette.primaria
                : AppPalette.black38,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              color: _selectedPage == index
                  ? AppPalette.primaria
                  : AppPalette.black38,
            ),
          ),
        ],
      ),
    );
  }

  _nextPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
