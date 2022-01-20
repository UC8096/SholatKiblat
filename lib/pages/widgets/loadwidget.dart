part of 'widgets.dart';

class LoadWidget extends StatelessWidget {
  const LoadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const widget = CircularProgressIndicator();

    return Container(
      alignment: Alignment.center,
      child: widget,
    );
  }
}
