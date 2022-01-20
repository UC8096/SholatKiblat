part of 'pages.dart';

class KiblatPage extends StatelessWidget {
  const KiblatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KiblatController>(builder: (controller) {
      return Scaffold(
        body: FutureBuilder(
          future: controller.deviceSupport,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error.toString()}'),
              );
            }
            if (snapshot.hasData) {
              return Center(child: QiblahCompassWidget());
            } else {
              return const Text('Error');
            }
          },
        ),
      );
    });
  }
}

class QiblahCompassWidget extends StatelessWidget {
  final _compassSvg = SvgPicture.asset(
    'assets/compass.svg',
    height: 300,
  );
  final _needleSvg = SvgPicture.asset(
    'assets/needle.svg',
    fit: BoxFit.contain,
    height: 250,
    alignment: Alignment.center,
  );

  QiblahCompassWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: LoadWidget());
        }

        final qiblahDirection = snapshot.data!;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Transform.rotate(
                  angle: ((qiblahDirection.direction.isNull
                          ? 0
                          : qiblahDirection.direction) *
                      (pi / 180) *
                      -1),
                  child: _compassSvg,
                ),
                Transform.rotate(
                  angle: ((qiblahDirection.qiblah.isNull
                          ? 0
                          : qiblahDirection.qiblah) *
                      (pi / 180) *
                      -1),
                  alignment: Alignment.center,
                  child: _needleSvg,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text("${qiblahDirection.offset.toStringAsFixed(3)}°"),
            )
          ],
        );
      },
    );
  }
}
