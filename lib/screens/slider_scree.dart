import 'package:components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100.0;
  bool _isSliderEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Slider'),
        ),
        body: Column(
          children: [
            Slider.adaptive(
              value: _sliderValue,
              min: 50,
              max: 400,
              activeColor: AppTheme.primary,
              // divisions: 10,
              onChanged: _isSliderEnabled
                  ? (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    }
                  : null,
            ),
            Checkbox(
              value: _isSliderEnabled,
              onChanged: (value) {
                setState(
                  () {
                    _isSliderEnabled = value ?? true;
                  },
                );
              },
            ),
            CheckboxListTile(
              value: _isSliderEnabled,
              activeColor: AppTheme.primary,
              title: const Text('Slider Enabled'),
              onChanged: (value) {
                setState(() {
                  _isSliderEnabled = value ?? true;
                });
              },
            ),
            SwitchListTile.adaptive(
              value: _isSliderEnabled,
              title: const Text('Switch Enabled'),
              activeColor: AppTheme.primary,
              onChanged: (value) {
                setState(() {
                  _isSliderEnabled = value;
                });
              },
            ),
            const AboutListTile(),
            Expanded(
              child: SingleChildScrollView(
                child: Image(
                  image: const NetworkImage(
                    'https://m.media-amazon.com/images/I/61UKuCoK03L._AC_SY679_.jpg',
                  ),
                  fit: BoxFit.contain,
                  width: _sliderValue,
                ),
              ),
            ),
          ],
        ));
  }
}
