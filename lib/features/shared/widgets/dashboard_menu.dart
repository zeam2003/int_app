import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardMenu extends StatelessWidget {
  const DashboardMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      _MenuItem(
        icon: FontAwesomeIcons.ticket, 
        label: 'Mis Tickets'),
      _MenuItem(icon: FontAwesomeIcons.clipboard, label: 'Dashboard'),
      _MenuItem(icon: FontAwesomeIcons.chartLine, label: 'Reportes'),
      _MenuItem(icon: FontAwesomeIcons.truck, label: 'Pedidos'),
      _MenuItem(icon: FontAwesomeIcons.taxi, label: 'Viajes'),
      _MenuItem(icon: FontAwesomeIcons.link, label: 'Utiles'),
      _MenuItem(icon: FontAwesomeIcons.gears, label: 'Preferencias'),
      _MenuItem(icon: FontAwesomeIcons.question, label: 'Ayuda'),
      
    ];

    return Padding(
      
      padding: const EdgeInsets.symmetric(vertical: 160, horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Cantidad de columnas
          crossAxisSpacing: 12.0, // Espacio horizontal entre los ítems
          mainAxisSpacing: 12.0, // Espacio vertical entre los ítems
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return _MenuCard(item: item);
        },
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String label;

  _MenuItem({required this.icon, required this.label});
}

class _MenuCard extends StatelessWidget {
  final _MenuItem item;

  const _MenuCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Acciones al hacer clic en el ítem
        print('Seleccionaste ${item.label}');
      },
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(item.icon, size: 40, color: Colors.blueAccent),
            const SizedBox(height: 8.0),
            Text(
              item.label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
