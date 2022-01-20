part of 'pages.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              "Selamat Datang di",
              style: blackBoldPoppins.copyWith(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
              child: Image.asset(
                "assets/SholatKiblat.png",
                height: 100,
              ),
            ),
            Text(
              "Supaya tau waktu dan arah sholat",
              style: poppins.copyWith(fontSize: 12),
            ),
            const SizedBox(
              height: 250,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.zero,
              ),
              onPressed: () => Get.toNamed('/home'),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                child: Text(
                  "Get Started",
                  style: blackBoldPoppins.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
