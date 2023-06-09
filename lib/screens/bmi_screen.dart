import 'package:flutter/material.dart';
import '../shared/menu_drawer.dart';
import '../shared/menu_bottom.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final double fontSize = 18;
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  late List <bool> isSelected;
  String heightMessage = '';
  String weightMessage = '';

  @override
  void initState(){
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage = 'Please insert your height in ' + ((isMetric) ? 'meters' : 'inches');    heightMessage = 'Please insert your height in ' + ((isMetric) ? 'meters' : 'inches');
    weightMessage = 'Please insert your weight in ' + ((isMetric) ? 'kilo' : 'pounds');

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'BMI Calculator'
        ),
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ToggleButtons(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Metric',
                    style: TextStyle(
                        fontSize: fontSize
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Imperial',
                    style: TextStyle(
                        fontSize: fontSize
                    ),
                  ),
                ),
              ],
              isSelected: isSelected,
              onPressed: toggleMeasure,
            ),
            Padding(
              child: TextField(
                controller: txtHeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: heightMessage
                ),
              ),
              padding: EdgeInsets.all(24.0),
            ),
            Padding(
                child: TextField(
                  controller: txtWeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: weightMessage
                  ),
                ),
                padding: EdgeInsets.all(24.0)
            ),
            ElevatedButton(
              child: Text('Calculate BMI',
                style: TextStyle(
                    fontSize: fontSize
                ),
              ),
              onPressed: findBMI,
            ),
            Text(result,
              style: TextStyle(
                  fontSize: fontSize
              ),
            )
          ],
        ),
      )
    );
  }

  void toggleMeasure(value){
    if (value == 0){
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBMI(){
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;
    if (isMetric){
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }
    setState(() {
      result = 'Your BMI is ' + bmi.toStringAsFixed(2);
    });
  }
}
