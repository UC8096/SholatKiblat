part of 'pages.dart';

class GridKontenPage extends StatelessWidget {
  GridKontenPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KontenController>(builder: (controller) {
      return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/SholatKiblat.png',
                      width: 80,
                      height: 80,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: blueColor,
                ),
              ),
              (controller.isCreator.value == true)
                  ? ListTile(
                      leading: const Icon(Icons.add_to_photos),
                      title: const Text('Tambah Konten'),
                      onTap: () => Get.toNamed("/createOrUpdate/",
                          arguments: {"drawerkey": _scaffoldKey}),
                    )
                  : const SizedBox(),
              ListTile(
                leading: const Icon(Icons.logout_rounded),
                title: const Text('Log Out'),
                onTap: () {
                  controller.logout();
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 20.0),
          child: FloatingActionButton(
            backgroundColor: grayColor,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.menu,
                  size: 27,
                  color: blueColor,
                ),
              ),
              decoration: const BoxDecoration(shape: BoxShape.circle),
            ),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: StreamBuilder<QuerySnapshot>(
            stream: controller.fetchKonten,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return (snapshot.data!.docs.isEmpty)
                    ? Center(
                        child: Text(
                        "Kosong",
                        style: darkgreyBoldPoppins.copyWith(fontSize: 22),
                      ))
                    : ListView(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 100,
                                ),
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: List.generate(
                                      snapshot.data!.docs.length, (index) {
                                    var kontenInfo = snapshot.data!.docs[index];

                                    print(kontenInfo);
                                    print("Konten Id :" + kontenInfo.id);

                                    return TextButton(
                                      onPressed: () =>
                                          Get.toNamed("/detail/", arguments: {
                                        'image': kontenInfo['image'],
                                        'title': kontenInfo['title'],
                                        'desc': kontenInfo['description'],
                                        'docID': kontenInfo.id,
                                        'isCreator': controller.isCreator.value
                                      }),
                                      child: SizedBox(
                                        width: (Get.width - 3) / 3,
                                        height: (Get.width - 3) / 3,
                                        child: (kontenInfo['image'] == null)
                                            ? const Icon(
                                                Icons
                                                    .image_not_supported_outlined,
                                                size: 40,
                                              )
                                            : Image.network(kontenInfo['image'],
                                                fit: BoxFit.cover),
                                      ),
                                    );
                                  }),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
              } else {
                return const Center(child: LoadWidget());
              }
            }),
      );
    });
  }
}
