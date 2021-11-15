part of 'pages.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: Container(
                            height: 170,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: asharColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "SAT",
                                        style: whiteBoldPoppins.copyWith(
                                            fontSize: 16),
                                      ),
                                      Text(
                                        "23 NOV",
                                        style: whiteBoldPoppins.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "2021",
                                        style: whiteBoldPoppins.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.light_mode_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Text("ASHAR",
                                          style: whiteBoldPoppins.copyWith(
                                              fontSize: 35,
                                              fontWeight: FontWeight.w900)),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: Colors.white,
                                          ),
                                          Text("Yogyakarta",
                                              style: whiteBoldPoppins.copyWith(
                                                  fontSize: 14)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "15:40",
                                    style:
                                        whiteBoldPoppins.copyWith(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        _adzanBox("Subuh", "03.50"),
                        _adzanBox("Dzuhuur", "03.50"),
                        _adzanBox("Ashar", "03.50"),
                        _adzanBox("Magrib", "03.50"),
                        _adzanBox("Isya", "03.50"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _adzanBox(String? adzan, String? time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 70,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: grayColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              adzan.toString(),
              style: blackBoldPoppins.copyWith(fontSize: 22),
            ),
            Text(
              time.toString(),
              style: darkgreyBoldPoppins.copyWith(fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
