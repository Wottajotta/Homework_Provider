import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Homework Provider",
          style: TextStyle(color: Provider.of<RandColor>(context).randColors),
        ),
        centerTitle: true,
      ),
      body: const Page(),
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  PageState createState() => PageState();
}

class PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: 200,
            height: 200,
            color: Provider.of<RandColor>(context).randColors,
          ),
        ),
        const Divider(),
        const SwitchButton(),
      ],
    );
  }
}

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  SwitchButtonState createState() => SwitchButtonState();
}

class SwitchButtonState extends State<SwitchButton> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: light,
        activeColor: Provider.of<RandColor>(context).randColors,
        onChanged: (bool value) {
          setState(() {
            Provider.of<RandColor>(context, listen: false).randomColor();
            light = value;
          });
        });
  }
}

class RandColor extends ChangeNotifier {
dynamic randColors;

  void randomColor() {
    randColors = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    notifyListeners();
  }
}
