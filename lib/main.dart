//Paola Andrea Guzmán Aristizábal

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Monedas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Conversor de Monedas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _monedain = "";
  String _monedaout = "";
  final _valorin = TextEditingController();
  double _valorfinal = 0.0;

  void _calcular() {
    setState(() {
      switch (_monedain) {
        case "Peso": {
          switch (_monedaout) {
            case "Peso": _valorfinal=double.parse(_valorin.text)*1;
            break;
            case "Euro": _valorfinal=double.parse(_valorin.text)*0.00022;
              break;
            case "Dólar": _valorfinal=double.parse(_valorin.text)*0.00024;
              break;
          }
        }
          break;
        case "Euro": {
          switch (_monedaout) {
            case "Peso": _valorfinal=double.parse(_valorin.text)*4492.85;
            break;
            case "Euro": _valorfinal=double.parse(_valorin.text)*1;
            break;
            case "Dólar": _valorfinal=double.parse(_valorin.text)*1.06;
            break;
          }
        }
          break;
        case "Dólar": {
          switch (_monedaout) {
            case "Peso": _valorfinal=double.parse(_valorin.text)*4240.96;
            break;
            case "Euro": _valorfinal=double.parse(_valorin.text)*0.94;
            break;
            case "Dólar": _valorfinal=double.parse(_valorin.text)*1;
            break;
          }
        }
          break;
      }
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:24, vertical:24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
                '$_monedain a $_monedaout',
              ),
              Text(
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                '${_valorfinal.toStringAsFixed(1)}',
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width/2)-32,
                    child: DropdownButtonFormField(
                      items: <String>["Peso", "Euro", "Dólar"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? valuein) {
                        setState((){_monedain = valuein!;});
                      },
                      icon: const Icon(
                          Icons.monetization_on,
                          color: Colors.green,
                      ),
                      dropdownColor:Colors.green.shade50,
                      decoration: const InputDecoration(
                        labelText: "Moneda inicial",
                        border:OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width/2)-32,
                    child: TextFormField(
                      controller: _valorin,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.green,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 3.0,
                          ),
                        ),
                        //contentPadding: EdgeInsets.symmetric(vertical:25.0, horizontal:10.0),
                        labelText: "Ingrese el valor",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width/2)-32,
                    child: DropdownButtonFormField(
                      items: <String>["Peso", "Euro", "Dólar"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? valuein) {
                        setState((){_monedaout = valuein!;});
                      },
                      icon: const Icon(
                        Icons.monetization_on,
                        color: Colors.green,
                      ),
                      dropdownColor:Colors.green.shade50,
                      decoration: const InputDecoration(
                        labelText: "Moneda final",
                        border:OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width/2)-32,
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black54,
                        width:1.0,
                      ),
                    ),
                    child: Center(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      child: Text(
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      '${_valorfinal.toStringAsFixed(4)}',
                    ),),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.currency_exchange, size: 35),
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 25.0),
                ),
                label: const Text("Calcular"),
                onPressed: () {
                  _calcular();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
