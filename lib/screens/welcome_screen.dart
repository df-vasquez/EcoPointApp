import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'scan_qr_screen.dart';
import 'redeem_screen.dart';
import 'package:google_fonts/google_fonts.dart'; // Fuente personalizada
import 'package:animated_text_kit/animated_text_kit.dart'; // Animaciones de texto

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int ecoPoints = 1250; // Valor inicial

  void _updateEcoPoints(int points) {
    if (mounted) {
      setState(() {
        ecoPoints += points;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '¡Bienvenido a EcoPoint!',
          style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.green],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', width: 150, height: 150),
              const SizedBox(height: 24.0),
              SizedBox(
                width: 250,
                child: DefaultTextStyle(
                  style: GoogleFonts.lato(fontSize: 26, color: Colors.white, fontWeight: FontWeight.w400),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('¡Aquí todos ganan!'),
                      TypewriterAnimatedText('Únete a la revolución ecológica'),
                      TypewriterAnimatedText('Canjea puntos por recompensas'),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              _buildActionSection(context),
              const SizedBox(height: 32.0),
              _buildEcoPointsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionSection(BuildContext context) {
    return Column(
      children: [
        _buildActionButton(
          icon: Icons.location_on,
          label: 'Encuéntranos',
          color: Colors.orange,
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MapScreen())),
        ),
        const SizedBox(height: 20.0),
        _buildActionButton(
          icon: Icons.qr_code_scanner,
          label: 'Escanea tu QR',
          color: Colors.blue,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScanQrScreen(onPointsEarned: _updateEcoPoints)),
          ),
        ),
        const SizedBox(height: 20.0),
        _buildActionButton(
          icon: Icons.card_giftcard,
          label: 'Canjea tus EcoPoints',
          color: Colors.greenAccent,
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RedeemScreen())),
        ),
      ],
    );
  }

  Widget _buildActionButton({required IconData icon, required String label, required Color color, required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        shadowColor: Colors.black,
        elevation: 6,
      ),
      icon: Icon(icon, color: Colors.white, size: 26),
      label: Text(
        label,
        style: GoogleFonts.lato(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _buildEcoPointsSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          const Text(
            'Total EcoPoints:',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          const SizedBox(height: 18.0),
          Text(
            '$ecoPoints',
            style: GoogleFonts.lato(fontSize: 38.0, fontWeight: FontWeight.bold, color: Colors.greenAccent),
          ),
        ],
      ),
    );
  }
}
