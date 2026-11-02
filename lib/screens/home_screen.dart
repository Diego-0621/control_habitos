
import 'package:flutter/material.dart';
import '../models/habito.dart';
import '../widgets/cabecera_estatica.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Colección tipada de hábitos
  final List<Habito> _listaHabitos = [
    Habito(nombre: 'Tomar Agua (Vasos)', icono: Icons.local_drink, meta: 8),
    Habito(nombre: 'Estudiar Flutter', icono: Icons.code, meta: 2),
    Habito(nombre: 'Actividad Física', icono: Icons.fitness_center, meta: 1),
  ];

  // Función para incrementar el contador de un hábito específico
  void _incrementarContador(int index) {
    setState(() {
      _listaHabitos[index].contador++;
    });
  }

  // Función para reiniciar todos los contadores a cero
  void _reiniciarDia() {
    setState(() {
      for (var habito in _listaHabitos) {
        habito.contador = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control de Hábitos'),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Widget propio Stateless
          const CabeceraEstatica(),
          
          // Lista de hábitos con Padding y Cards
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _listaHabitos.length,
              itemBuilder: (context, index) {
                final habito = _listaHabitos[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(habito.icono, size: 36, color: Colors.red.shade900),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  habito.nombre,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Progreso: ${habito.contador} / ${habito.meta}',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade900,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () => _incrementarContador(index),
                            child: const Text('+ Registrar'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // Botón global de acción para reiniciar el día
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _reiniciarDia,
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.refresh),
        label: const Text('Reiniciar día'),
      ),
    );
  }
}