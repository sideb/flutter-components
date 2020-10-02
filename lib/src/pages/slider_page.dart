import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;
  bool _locked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              _createSlider(),
              _createCheckBox(),
              _createSwitch(),
              Expanded(child: _createImage()),
            ],
          )),
    );
  }

  Widget _createSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño',
        min: 10.0,
        max: 400.0,
        value: _sliderValue,
        onChanged: (_locked)
            ? null
            : (value) {
                setState(() {
                  _sliderValue = value;
                });
              });
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://upload.wikimedia.org/wikipedia/commons/1/18/Batman_logo.jpg'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckBox() {
    return CheckboxListTile(
        title: Text('Bloquear tamaño'),
        value: _locked,
        onChanged: (value) {
          setState(() {
            _locked = value;
          });
        });
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: Text('Bloquear tamaño'),
        value: _locked,
        onChanged: (value) {
          setState(() {
            _locked = value;
          });
        });
  }
}
