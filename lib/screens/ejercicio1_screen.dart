import 'package:flutter/material.dart';

class Ejercicio1Screen extends StatefulWidget {
  @override
  _Ejercicio1ScreenState createState() => _Ejercicio1ScreenState();
}

class _Ejercicio1ScreenState extends State<Ejercicio1Screen> {
  final _velocidadInicialController = TextEditingController();
  final _velocidadFinalController = TextEditingController();
  final _tiempoController = TextEditingController();
  String _resultado = '';
  String _error = '';

  void _calcularAceleracion() {
    setState(() {
      _error = '';
      _resultado = '';
      
      try {
        double velocidadInicial = double.parse(_velocidadInicialController.text);
        double velocidadFinal = double.parse(_velocidadFinalController.text);
        double tiempo = double.parse(_tiempoController.text);
        
        if (tiempo == 0) {
          _error = 'Error: el tiempo debe ser mayor a 0.';
          return;
        }
        
        double aceleracion = (velocidadFinal - velocidadInicial) / tiempo;
        _resultado = 'Aceleración: ${aceleracion.toStringAsFixed(2)} m/s²';
      } catch (e) {
        _error = 'Por favor ingresa valores válidos';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Ejercicio 1: Cálculo de Aceleración',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Determinar la aceleración de un objeto cuando cambia su velocidad en un tiempo dado.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            TextField(
              controller: _velocidadInicialController,
              decoration: InputDecoration(
                labelText: 'Velocidad inicial (m/s)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _velocidadFinalController,
              decoration: InputDecoration(
                labelText: 'Velocidad final (m/s)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _tiempoController,
              decoration: InputDecoration(
                labelText: 'Tiempo (s)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularAceleracion,
              child: Text('Calcular Aceleración'),
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
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Fórmula: a = (Vf - Vi) / t',
                style: TextStyle(fontStyle: FontStyle.italic, color: Colors.blue[800]),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _velocidadInicialController.dispose();
    _velocidadFinalController.dispose();
    _tiempoController.dispose();
    super.dispose();
  }
}
