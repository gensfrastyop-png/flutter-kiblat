import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class QiblaPage extends StatefulWidget {
  const QiblaPage({super.key});

  @override
  _QiblaPageState createState() => _QiblaPageState();
}

class _QiblaPageState extends State<QiblaPage> {
  final _qiblahStream = FlutterQiblah.qiblahStream;
  StreamSubscription? _sub;
  String _status = "Memeriksa izin lokasi...";

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => _status = "Layanan lokasi tidak aktif.");
      return;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
      setState(() => _status = "Izin lokasi ditolak. Silakan aktifkan izin.");
      return;
    }
    setState(() => _status = "Siap. Arah kiblat ditampilkan.");
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Arah Kiblat")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_status != "Siap. Arah kiblat ditampilkan.")
            Padding(padding: EdgeInsets.all(16), child: Text(_status)),
          Expanded(
            child: StreamBuilder(
              stream: _qiblahStream,
              builder: (context, AsyncSnapshot<QiblahDirection> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text("Menunggu data..."));
                }
                final qiblah = snapshot.data!;
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.rotate(
                        angle: (qiblah.direction * (3.1415926535 / 180) * -1),
                        child: Icon(Icons.navigation, size: 120),
                      ),
                      SizedBox(height: 12),
                      Text("Arah: ${qiblah.direction.toStringAsFixed(2)}°"),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
