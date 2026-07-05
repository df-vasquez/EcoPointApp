import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'map_screen.dart';
import 'scan_qr_screen.dart';
import 'redeem_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int ecoPoints = 100;

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
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Icon(Icons.eco, size: 100, color: Color(0xFF00C853)),
            const SizedBox(height: 20),
            Text(
              '¡Bienvenido a EcoPoint!',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 280,
              child: DefaultTextStyle(
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.white70),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Recicla y gana recompensas'),
                    TypewriterAnimatedText('Cada botella cuenta'),
                    TypewriterAnimatedText('Acumula EcoPoints y canjea'),
                  ],
                  repeatForever: true,
                ),
              ),
            ),
            const SizedBox(height: 30),
            _buildEcoPointsSection(),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSquareButton(
                          icon: Icons.location_on,
                          label: 'Encuentra un punto',
                          color: Colors.blueAccent,
                          onPressed:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MapScreen(),
                                ),
                              ),
                        ),
                        _buildSquareButton(
                          icon: Icons.qr_code_scanner,
                          label: 'Escanear QR',
                          color: Colors.orange,
                          onPressed:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => ScanQrScreen(
                                        onPointsEarned: _updateEcoPoints,
                                      ),
                                ),
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSquareButton(
                          icon: Icons.card_giftcard,
                          label: 'Canjear puntos',
                          color: Colors.green,
                          onPressed:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RedeemScreen(),
                                ),
                              ),
                        ),
                        _buildSquareButton(
                          icon: Icons.share,
                          label: 'Invita a amigos',
                          color: Colors.purple,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSquareButton(
                          icon: Icons.info_outline,
                          label: 'Cómo funciona',
                          color: Colors.teal,
                          onPressed: () {},
                        ),
                        _buildSquareButton(
                          icon: Icons.star,
                          label: 'Beneficios',
                          color: Colors.amber,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSquareButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadowColor: Colors.black,
            elevation: 8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 30),
              const SizedBox(height: 8),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
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
            'Total de EcoPoints',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12.0),
          Text(
            '$ecoPoints',
            style: GoogleFonts.poppins(
              fontSize: 38.0,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent,
            ),
          ),
        ],
      ),
    );
  }
}
