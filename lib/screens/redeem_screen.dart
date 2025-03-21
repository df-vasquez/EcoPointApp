import 'package:flutter/material.dart';

class RedeemScreen extends StatelessWidget {
  const RedeemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Canjea tus EcoPoints',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.green],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildRewardItem(
              icon: Icons.shopping_cart,
              title: '20% de descuento en X tienda',
              description: 'Válido hasta el 31 de octubre',
            ),
            _buildRewardItem(
              icon: Icons.local_offer,
              title: '2x1 en productos seleccionados',
              description: 'Hasta el 15 de noviembre',
            ),
            _buildRewardItem(
              icon: Icons.coffee,
              title: 'Café gratis en Z Cafetería',
              description: 'Canjea con tus EcoPoints',
            ),
            _buildRewardItem(
              icon: Icons.movie,
              title: '50% de descuento en entradas de cine',
              description: 'Válido hasta el 30 de diciembre',
            ),
            _buildRewardItem(
              icon: Icons.shopping_bag,
              title: 'Descuento de 10 soles en GreenMarket',
              description: 'Aplica en tu próxima compra',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      color: Colors.green.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: ListTile(
        leading: Icon(icon, color: Colors.green, size: 40),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(fontSize: 14.0, color: Colors.white70),
        ),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: const Text('Canjear', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
