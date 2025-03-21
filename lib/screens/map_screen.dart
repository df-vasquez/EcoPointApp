import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mapa de EcoPoints',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Fondo con un gradiente oscuro-verde
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.green],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Imagen de mapa de ejemplo (sustituir por mapa real en el futuro)
          Positioned.fill(
            child: Image.asset(
              'assets/images/map_placeholder.png', // Agrega una imagen de mapa de ejemplo
              fit: BoxFit.cover,
            ),
          ),
          // Texto central atractivo
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Text(
                'Encuentra el EcoPoint más cercano',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Marcadores de puntos en cada esquina del mapa
          _buildMapMarker(left: 20, top: 50),
          _buildMapMarker(right: 20, top: 50),
          _buildMapMarker(left: 20, bottom: 50),
          _buildMapMarker(right: 20, bottom: 50),
        ],
      ),
    );
  }

  // Método para crear un marcador en el mapa
  Widget _buildMapMarker({double? left, double? right, double? top, double? bottom}) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: Icon(
        Icons.location_on,
        color: Colors.red,
        size: 40,
      ),
    );
  }
}