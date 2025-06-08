import 'package:flutter/material.dart';

class Ejercicio3Screen extends StatefulWidget {
  @override
  _Ejercicio3ScreenState createState() => _Ejercicio3ScreenState();
}

class _Ejercicio3ScreenState extends State<Ejercicio3Screen> {
  final _profundidadController = TextEditingController();
  final _densidadController = TextEditingController();
  final _gravedadController = TextEditingController();
  String _resultado = '';
  String _error = '';

  @override
  void initState() {
    super.initState();
    // Valores por defecto
    _densidadController.text = '1000'; // Agua
    _gravedadController.text = '9.8'; // Gravedad estándar
  }

  void _calcularPresion() {
    setState(() {
      _error = '';
      _resultado = '';
      
      try {
        double profundidad = double.parse(_profundidadController.text);
        double densidad = double.parse(_densidadController.text);
        double gravedad = double.parse(_gravedadController.text);
        
        if (profundidad < 0) {
          _error = 'La profundidad no puede ser negativa';
          return;
        }
        
        double presion = densidad * gravedad * profundidad;
        _resultado = 'Presión: ${presion.toStringAsFixed(2)} Pa';
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
              'Ejercicio 3: Presión en Líquidos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Determinar la presión en un líquido, dada la profundidad, densidad del fluido y gravedad.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            TextField(
              controller: _profundidadController,
              decoration: InputDecoration(
                labelText: 'Profundidad (metros)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _densidadController,
              decoration: InputDecoration(
                labelText: 'Densidad del fluido (kg/m³)',
                hintText: 'Agua = 1000 kg/m³',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _gravedadController,
              decoration: InputDecoration(
                labelText: 'Gravedad (m/s²)',
                hintText: 'Estándar = 9.8 m/s²',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularPresion,
              child: Text('Calcular Presión'),
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
                'Fórmula: P = densidad × gravedad × profundidad',
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
    _profundidadController.dispose();
    _densidadController.dispose();
    _gravedadController.dispose();
    super.dispose();
  }
}