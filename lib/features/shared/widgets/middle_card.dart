import 'package:flutter/material.dart';

class MiddleCard extends StatelessWidget {
  const MiddleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: Colors.blue.shade400,
            size: 32,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Bienvenido de nuevo. Aquí puedes gestionar tus tickets, pedidos y más.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}