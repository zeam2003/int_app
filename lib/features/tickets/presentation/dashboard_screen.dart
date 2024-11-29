
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: Text(
          'Bienvenido al Dashboard',
          style: GoogleFonts.roboto(
            fontSize: 20,
            color: Colors.blue[800],
          ),
        ),
      ),
    );
  }
}