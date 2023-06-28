import 'package:flutter/material.dart';


void main() {
  runApp(const ToggleSwitch());
}
class ToggleSwitch extends StatefulWidget {

  const ToggleSwitch({Key? key}) : super(key: key);

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool switchValue=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('switch Case'),),
        body: Switch(
          value: switchValue,
          onChanged: (bool value) {
            setState(() {
              switchValue= value;
            });
          },),
      ),
    );
  }
}
