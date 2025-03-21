import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'dart:async';

class ScanQrScreen extends StatefulWidget {
  final Function(int) onPointsEarned;
  const ScanQrScreen({super.key, required this.onPointsEarned});

  @override
  _ScanQrScreenState createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  String scannedData = "";
  bool _hasScanned = false;
  final MobileScannerController _scannerController = MobileScannerController();

  void _onDetect(BarcodeCapture barcode) {
    if (_hasScanned) return;
    
    final String? code = barcode.barcodes.first.rawValue;
    if (code != null) {
      setState(() {
        scannedData = code;
        _hasScanned = true;
      });

      _scannerController.stop();

      if (scannedData.startsWith("ecopoints:botella")) {
        int cantidad = int.tryParse(scannedData.replaceAll("ecopoints:botella", "")) ?? 1;
        int puntosGanados = cantidad * 100;
        widget.onPointsEarned(puntosGanados);
        _navigateToConfirmationScreen(puntosGanados);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Código QR no válido')),
        );
      }
    }
  }

  void _navigateToConfirmationScreen(int puntos) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationScreen(puntos: puntos),
      ),
    );
    
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escanear QR', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
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
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  MobileScanner(
                    controller: _scannerController,
                    onDetect: _onDetect,
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.qr_code_scanner, size: 100, color: Colors.white),
                  //SizedBox(height: 24.0),
                  Text(
                    'Apunta tu código QR hacia la cámara',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmationScreen extends StatefulWidget {
  final int puntos;
  const ConfirmationScreen({super.key, required this.puntos});

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  int _secondsRemaining = 5;
  late Timer _timer;
  bool showPointsMessage = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          setState(() {
            showPointsMessage = true;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.green],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                showPointsMessage ? Icons.emoji_events : Icons.lock_open,
                size: 100,
                color: Colors.green,
              ),
              const SizedBox(height: 24.0),
              Text(
                showPointsMessage
                    ? 'Has ganado ${widget.puntos} EcoPoints!'
                    : 'El contenedor está abierto, tiene $_secondsRemaining segundos para insertar los residuos',
                style: const TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, widget.puntos);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18)),
                child: const Text('Volver al Menú', style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
