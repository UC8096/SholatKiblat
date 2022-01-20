part of 'api.dart';

class ApiRequest {
  Future<JadwalSholat> fetchJadwalSholat(
      {String? longitude, String? latitude}) async {
    var client = http.Client();
    var jadwalSholat = JadwalSholat();

    final response = await client.get(Uri.parse(
        "https://api.pray.zone/v2/times/today.json?longitude=$longitude&latitude=$latitude"));
    if (response.statusCode == 200) {
      var jsonString = response.body;

      var jsonMap = json.decode(jsonString);

      jadwalSholat = JadwalSholat.fromMap(jsonMap);
    } else {
      throw Exception("failed to load");
    }
    return jadwalSholat;
  }
}
