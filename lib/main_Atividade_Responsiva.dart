import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'minha localização',
      home: const LocalizacaoPage(),
    );
  }
}

class LocalizacaoPage extends StatefulWidget {
  const LocalizacaoPage({super.key});

  @override
  State<LocalizacaoPage> createState() => _LocalizacaoPageState();
}

class _LocalizacaoPageState extends State<LocalizacaoPage> {
  double latitude = 0;
  double longitude = 0;

  
  double latitudeDestino = -21.453240;
  double longitudeDestino = -47.017570;

  
  double distancia = 0;

  Future<void> buscarLocalizacao() async {
    bool servicoAtivo = await Geolocator.isLocationServiceEnabled();

    if (!servicoAtivo) {
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permissao = await Geolocator.checkPermission();

    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
    }

    if (permissao == LocationPermission.denied ||
    permissao == LocationPermission.deniedForever) {
      return;
    }

    Position posicao = await Geolocator.getCurrentPosition();

    setState(() {
      latitude = posicao.latitude;
      longitude = posicao.longitude;

    
      distancia = Geolocator.distanceBetween(
        latitude,
        longitude,
        latitudeDestino,
        longitudeDestino,
      );
    });

    print('Latitude: $latitude');
    print('Longitude: $longitude');
    print('Distância: $distancia metros');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minha Localização')),

      body: Center(
       child:Padding(
         padding: const EdgeInsets.all(20),

         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const Icon(Icons.location_on, size: 80, color: Colors.red),

            const SizedBox(height: 20),

            const Text(
              'Localização Atual',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            Text('Latitude: $latitude', style: const TextStyle(fontSize: 18)),

            const SizedBox(height: 10),

            Text(
              'Longitude: $longitude',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 30),

            // DISTÂNCIA ATÉ O LOCAL PREDEFINIDO
            Text(
              'A Distância daqui até minha casa é: ${distancia.toStringAsFixed(2)} metros',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: buscarLocalizacao,
              child: const Text('Buscar Localização'),
            )
          ],
         ),
        ),
      ),
    );
  }
}