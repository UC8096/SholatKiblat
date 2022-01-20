part of 'pages.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JadwalController>(
        init: JadwalController(),
        builder: (controller) {
          return Scaffold(
            body: (controller.isProcessing.value == true)
                ? const Center(child: LoadWidget())
                : ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SafeArea(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 30.0),
                                  child: Obx(
                                    () => Container(
                                      height: 185,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: (controller.curShalat.value ==
                                                'Shubuh')
                                            ? subuhColor
                                            : (controller.curShalat.value ==
                                                    'Dhuhur')
                                                ? zuhurColor
                                                : (controller.curShalat.value ==
                                                        'Ashar')
                                                    ? asharColor
                                                    : (controller.curShalat
                                                                .value ==
                                                            'Maghrib')
                                                        ? magribColor
                                                        : isyaColor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.curDay
                                                      .toUpperCase(),
                                                  style: whiteBoldPoppins
                                                      .copyWith(fontSize: 16),
                                                ),
                                                Text(
                                                  controller.curDateMonth.value,
                                                  style:
                                                      whiteBoldPoppins.copyWith(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                ),
                                                Text(
                                                  controller.curYear.value,
                                                  style:
                                                      whiteBoldPoppins.copyWith(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  ((controller.curShalat
                                                                  .value ==
                                                              "Shubuh" ||
                                                          controller.curShalat
                                                                  .value ==
                                                              "Maghrib" ||
                                                          controller.curShalat
                                                                  .value ==
                                                              "Isya")
                                                      ? Icons.dark_mode_outlined
                                                      : Icons
                                                          .light_mode_outlined),
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text("menuju",
                                                    style: whiteBoldPoppins
                                                        .copyWith(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                                Text(controller.curShalat.value,
                                                    style: whiteBoldPoppins
                                                        .copyWith(
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900)),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.location_on,
                                                      color: Colors.white,
                                                      size: 18,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    SizedBox(
                                                      width: 120,
                                                      child: FittedBox(
                                                        fit: BoxFit.contain,
                                                        child: Text(
                                                            (controller.location
                                                                        .value ==
                                                                    "")
                                                                ? "Belum diTemukan"
                                                                : controller
                                                                    .location
                                                                    .value,
                                                            style:
                                                                whiteBoldPoppins
                                                                    .copyWith(
                                                                        fontSize:
                                                                            14)),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        controller.syncButton();
                                                      },
                                                      icon: Icon(
                                                        Icons.sync_rounded,
                                                        color: whiteColor,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  controller.timeNow.value,
                                                  style: whiteBoldPoppins
                                                      .copyWith(fontSize: 12),
                                                ),
                                                Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: whiteColor,
                                                ),
                                                Text(
                                                  controller
                                                      .curTimeShalat.value,
                                                  style: whiteBoldPoppins
                                                      .copyWith(fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            _adzanBox(
                                TimeSholatHelper.shubuh,
                                controller.shubuh.value,
                                controller.statusShubuh.value),
                            _adzanBox(
                                TimeSholatHelper.dhuhur,
                                controller.dhuhur.value,
                                controller.statusDhuhur.value),
                            _adzanBox(
                                TimeSholatHelper.ashar,
                                controller.ashar.value,
                                controller.statusAshar.value),
                            _adzanBox(
                                TimeSholatHelper.maghrib,
                                controller.maghrib.value,
                                controller.statusMaghrib.value),
                            _adzanBox(
                                TimeSholatHelper.isya,
                                controller.isya.value,
                                controller.statusIsya.value),
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        });
  }

  Widget _adzanBox(String? adzan, String? time, bool status) {
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
