import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Konverter Suhu'),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: MySuhuConverter(),
        ),
      ),
    );
  }
}

class MySuhuConverter extends StatefulWidget {
  const MySuhuConverter({Key? key}) : super(key: key);

  @override
  _MySuhuConverterState createState() => _MySuhuConverterState();
}

class _MySuhuConverterState extends State<MySuhuConverter> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _temperatureController = TextEditingController();
  double suhuKelvin = 0.0;
  double suhuReamur = 0.0;
  double suhuFahrenheit = 0.0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _temperatureController,
            decoration: InputDecoration(
              labelText: 'Masukkan Suhu Dalam Celcius (°C)',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Suhu Celcius : ${_temperatureController.text} °C',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Suhu Reamur : $suhuReamur °R',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Suhu Kelvin  : $suhuKelvin °K',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Suhu Fahrenheit : $suhuFahrenheit °F',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          SizedBox(height: 3),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                double suhuCelcius = double.parse(_temperatureController.text);
                // Perhitungan suhu
                suhuKelvin = suhuCelcius + 273;
                suhuReamur = suhuCelcius * 4 / 5;
                suhuFahrenheit = (suhuCelcius * 9 / 5) + 32;
                setState(() {}); // Memperbarui tampilan
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
            child: Text('Hitung'),
          ),
        ],
      ),
    );
  }
}
