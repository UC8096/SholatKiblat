part of 'controllers.dart';

class JadwalController extends GetxController {
  var location = ''.obs,
      latitude = ''.obs,
      longitude = ''.obs,
      today = '',
      curShalat = ''.obs,
      timeNow = '--:--'.obs,
      curTimeShalat = '--:--'.obs,
      curDay = ''.obs,
      curDateMonth = ''.obs,
      curYear = ''.obs,
      shubuh = '--:--'.obs,
      dhuhur = '--:--'.obs,
      ashar = '--:--'.obs,
      maghrib = '--:--'.obs,
      isya = '--:--'.obs,
      statusShubuh = false.obs,
      statusDhuhur = false.obs,
      statusAshar = false.obs,
      statusMaghrib = false.obs,
      statusIsya = false.obs,
      isProcessing = false.obs;

  late ApiRequest fetchJadwalSholat = ApiRequest();

  void curSholatData() {
    var _datenow = ConvertHelper.getTime(DateFormatHelper.time_1);
    var _splitdatenow = _datenow.split(' ');

    curDay.value = ConvertHelper.getTime(DateFormatHelper.time_5);
    curDateMonth.value = "${_splitdatenow[0]} ${_splitdatenow[1]}";
    curYear.value = _splitdatenow[2];

    update();
  }

  Timer? timer;

  Future getCurrenyLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((value) async {
      List<Placemark> daftarPlace =
          await placemarkFromCoordinates(value.latitude, value.longitude);
      Placemark place = daftarPlace[0];

      location.value = place.locality!;
      latitude.value = value.latitude.toString();
      longitude.value = value.longitude.toString();

      update();
    });
  }

  Future getPeriodicData(
      {required String latitude, required String longitude}) async {
    fetchJadwalSholat
        .fetchJadwalSholat(latitude: latitude, longitude: longitude)
        .then((value) {
      List<Datetime> _listDatetime = [];

      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        getCurrenyLocation();

        timeNow.value = DateFormat('HH:mm').format(DateTime.now());

        _listDatetime = value.results!.datetime!;

        for (var i = 0; i < _listDatetime.length; i++) {
          shubuh.value = _listDatetime[i].times!.fajr!;
          dhuhur.value = _listDatetime[i].times!.dhuhr!;
          ashar.value = _listDatetime[i].times!.asr!;
          maghrib.value = _listDatetime[i].times!.maghrib!;
          isya.value = _listDatetime[i].times!.isha!;

          var curTimeNow = ConvertHelper.timeToInt(timeNow.value);
          var iShubuh = ConvertHelper.timeToInt(shubuh.value);
          var iDhuhur = ConvertHelper.timeToInt(dhuhur.value);
          var iAshar = ConvertHelper.timeToInt(ashar.value);
          var iMaghrib = ConvertHelper.timeToInt(maghrib.value);
          var iIsya = ConvertHelper.timeToInt(isya.value);

          if (curTimeNow >= iShubuh && curTimeNow < iDhuhur) {
            statusDhuhur.value = true;
            curShalat.value = TimeSholatHelper.dhuhur;
            curTimeShalat.value = dhuhur.value;
          } else if (curTimeNow >= iDhuhur && curTimeNow < iAshar) {
            statusAshar.value = true;
            curShalat.value = TimeSholatHelper.ashar;
            curTimeShalat.value = ashar.value;
          } else if (curTimeNow >= iAshar && curTimeNow < iMaghrib) {
            statusMaghrib.value = true;
            curShalat.value = TimeSholatHelper.maghrib;
            curTimeShalat.value = maghrib.value;
          } else if (curTimeNow >= iMaghrib && curTimeNow < iIsya) {
            statusIsya.value = true;
            curShalat.value = TimeSholatHelper.isya;
            curTimeShalat.value = isya.value;
          } else {
            statusShubuh.value = true;
            curShalat.value = TimeSholatHelper.shubuh;
            curTimeShalat.value = shubuh.value;
          }
        }

        update();
      });
    });
  }

  Future syncButton() async {
    await getCurrenyLocation();

    await getPeriodicData(latitude: latitude.value, longitude: longitude.value);

    curSholatData();
  }

  @override
  void onReady() async {
    isProcessing.value = true;

    await syncButton();

    isProcessing.value = false;
    super.onReady();
  }

  @override
  void onInit() async {
    await getCurrenyLocation();

    super.onInit();
  }

  @override
  void onClose() {
    timer!.cancel();
    super.onClose();
  }
}
