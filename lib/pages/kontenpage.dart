part of 'pages.dart';

class KontenPage extends StatelessWidget {
  const KontenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KontenController>(builder: (controller) {
      return Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return GridKontenPage();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Something Went Wrong!"),
              );
            } else {
              return const LoginWidget();
            }
          },
        ),
      );
    });
  }
}
