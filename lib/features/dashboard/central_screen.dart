
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:int_app/features/auth/domain/entities/user.dart';
import 'package:int_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:int_app/features/shared/shared.dart';


class CentralScreen extends ConsumerWidget {
  const CentralScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    final authState= ref.watch(authProvider);
    
    final user = authState.user;
    //print(user?.glpiActiveprofilename);
    //print(authState);

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
      body:  Stack(
        children: [
          _HeaderDashboad(user),
          Positioned(
            top:130,
            left:16,
            right: 16,
           child: TicketsSummary(),
          ),
          Positioned(
            top: 370,
            left: 16,
            right: 16,
            child: MiddleCard(),
          ),
          Positioned(
            top: 245,
            left: 0,
            right: 0,
            child: DashboardMenu(),
          ),
          //SizedBox(height: 280,),
        
          //Expanded(child: DashboardMenu())
        ],
      )
    );
  }
}

class _HeaderDashboad extends StatelessWidget {
  final User? user;
  const _HeaderDashboad(this.user);

  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         _HeaderInnerDash(user:user),
      ]
        
       
      ,
      
    );
  }

}

class _HeaderInnerDash extends StatelessWidget {
  final User? user;

  const _HeaderInnerDash({ this.user});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.house, 
          title: user?.glpiFirstname ?? 'invitado', 
          //subtitulo: 'Selecciona una opción para empezar',
          color2: const Color(0xff66a9f2),
          color1: const Color(0xff536cf6),
         ),
         Positioned(
          right: 0,
          top:50,
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
