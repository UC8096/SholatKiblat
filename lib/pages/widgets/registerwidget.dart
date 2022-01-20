part of 'widgets.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KontenController>(builder: (controller) {
      return Scaffold(
        extendBody: true,
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
                      child: Image.asset(
                        "assets/SholatKiblat.png",
                        height: 80,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextField(
                        autofocus: false,
                        decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            filled: true,
                            hintStyle: poppins.copyWith(fontSize: 14),
                            hintText: "Name",
                            fillColor: Colors.white70),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextField(
                        autofocus: false,
                        decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            filled: true,
                            hintStyle: poppins.copyWith(fontSize: 14),
                            hintText: "Email Address",
                            fillColor: Colors.white70),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextField(
                        decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            filled: true,
                            hintStyle: poppins.copyWith(fontSize: 14),
                            hintText: "Password",
                            fillColor: Colors.white70),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: blueColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {},
                      child: Container(
                        width: 230,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            "register",
                            style:
                                blackBoldPoppins.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sudah punya akun ?",
                              style: poppins.copyWith(fontSize: 12),
                            ),
                            TextButton(
                              onPressed: () => Get.back(),
                              child: Text(
                                "Sign In",
                                style: blackBoldPoppins.copyWith(fontSize: 12),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 20.0),
          child: FloatingActionButton(
            backgroundColor: grayColor,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 27,
                  color: blueColor,
                ),
              ),
              decoration: const BoxDecoration(shape: BoxShape.circle),
            ),
            onPressed: () => Get.back(),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      );
    });
  }
}
