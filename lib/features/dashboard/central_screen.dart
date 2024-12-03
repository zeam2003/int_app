
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:int_app/features/shared/shared.dart';
import 'package:int_app/features/shared/widgets/dashboard_menu.dart';

class CentralScreen extends StatelessWidget {
  const CentralScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: SideMenu( scaffoldKey: scaffoldKey ),
      /* appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon( Icons.search_rounded)
          )
        ],
      ), */
      body: const Stack(
        children: [
          _HeaderDashboad(),
          SizedBox(height: 280,),
        
          Expanded(child: DashboardMenu())
        ],
      )
    );
  }
}

class _HeaderDashboad extends StatelessWidget {
  const _HeaderDashboad();
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         _HeaderInnerDash(),
      ]
        
       
      ,
      
    );
  }

}

class _HeaderInnerDash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(
          icon: FontAwesomeIcons.house, 
          title: 'Juan Pelotas', 
          subtitulo: 'Selecciona una opción para empezar',
          color2: Color(0xff66a9f2),
          color1: Color(0xff536cf6),
         ),
         Positioned(
          right: 0,
          top: 46,
          child: RawMaterialButton(
            onPressed: (){},
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15.0),
            child: const FaIcon(FontAwesomeIcons.ellipsisVertical, color: Colors.white,)
            ),
        ),
      ],
    );

  }

}


class _ProductsView extends StatelessWidget {
  const _ProductsView();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Eres genial!'));
  }
}