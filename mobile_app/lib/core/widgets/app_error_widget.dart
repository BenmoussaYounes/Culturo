import 'package:flutter/widgets.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget(this.errorMessge, {super.key});
  final String errorMessge;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessge, style: const TextStyle(fontSize: 16, color: Color(0xFFB00020))),
    );
  }
}
