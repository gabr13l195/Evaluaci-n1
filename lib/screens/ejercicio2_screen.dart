import 'package:flutter/material.dart';

class Ejercicio2Screen extends StatefulWidget {
  @override
  _Ejercicio2ScreenState createState() => _Ejercicio2ScreenState();
}

class _Ejercicio2ScreenState extends State<Ejercicio2Screen> {
  final _distanciaController = TextEditingController();
  final _eficienciaController = TextEditingController();
  final _precioController = TextEditingController();
  String _resultado = '';
  String _error = '';

  void _calcularCosto() {
    setState(() {
      _error = '';
      _resultado = '';
      
      try {
        double distancia = double.parse(_distanciaController.text);
        double eficiencia = double.parse(_eficienciaController.text);
        double precio = double.parse(_precioController.text);
        
        if (eficiencia <= 0) {
          _error = 'La eficiencia debe ser mayor a 0';
          return;
        }
        
        double litrosNecesarios = distancia / eficiencia;
        double costoTotal = litrosNecesarios * precio;
        
        _resultado = 'Costo total del viaje: \$${costoTotal.toStringAsFixed(2)}';
      } catch (e) {
        _error = 'Por favor ingresa valores válidos';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text(
                'Ejercicio 2: Costo de Combustible',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Calcular el costo total de combustible para un viaje.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              TextField(
                controller: _distanciaController,
                decoration: InputDecoration(
                  labelText: 'Distancia del viaje (km)',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _eficienciaController,
                decoration: InputDecoration(
                  labelText: 'Eficiencia del auto (km/litro)',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _precioController,
                decoration: InputDecoration(
                  labelText: 'Precio por litro de combustible',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularCosto,
                child: Text('Calcular Costo'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
              SizedBox(height: 20),
              if (_error.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    _error,
                    style: TextStyle(color: Colors.red[800], fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              if (_resultado.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    _resultado,
                    style: TextStyle(color: Colors.green[800], fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _distanciaController.dispose();
    _eficienciaController.dispose();
    _precioController.dispose();
    super.dispose();
  }
}