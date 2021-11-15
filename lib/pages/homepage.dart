part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              const JadwalPage(),
              KiblatPage(),
              const KontenPage(),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 100,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: BottomNavigationBar(
                iconSize: 40,
                unselectedItemColor: darkgrayColor,
                selectedItemColor: blueColor,
                onTap: controller.changeTabIndex,
                currentIndex: controller.tabIndex,
                showSelectedLabels: true,
                selectedLabelStyle: poppins.copyWith(fontSize: 14),
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                elevation: 0,
                items: [
                  _bottomNavigationBarItem(
                    icon: Icons.schedule,
                    label: 'Jadwal',
                  ),
                  _bottomNavigationBarItem(
                    icon: Icons.explore,
                    label: 'Kiblat',
                  ),
                  _bottomNavigationBarItem(
                    icon: Icons.content_paste,
                    label: 'Konten',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Icon(icon),
      ),
      label: label,
    );
  }
}
