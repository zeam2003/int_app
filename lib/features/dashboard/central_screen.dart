
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
    final size = MediaQuery.of(context).size;

    final scaffoldKey = GlobalKey<ScaffoldState>();

    final authState= ref.watch(authProvider);
    
    final user = authState.user;
    //print(user?.glpiActiveprofilename);
    //print(authState);
    return Scaffold(
    body: LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;

        return Column(
         children: [
            // Stack para HeaderDashboard y MiddleCard
            SizedBox(
              height: height * 0.3, // Espacio combinado para Header y MiddleCard
              child: Stack(
                children: [
                  // HeaderDashboard (ocupa 20% del total de la pantalla)
                  Positioned.fill(
                    top: 0,
                    child: SizedBox(
                      height: height * 0.2, // Ajusta según tus necesidades
                      child: _HeaderDashboad(user),
                    ),
                  ),

                  // MiddleCard (solapado al HeaderDashboard)
                  Positioned(
                    top: height * 0.13, // Ajustar la posición para el solapado
                    left: width * 0.05,
                    right: width * 0.05,
                    child: Container(
                      height: height * 0.10, // Ajustar la altura según diseño
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow:const  [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const MiddleCard(),
                    ),
                  ),
                ],
              ),
            ),

            // TicketSummary - Fijo debajo del MiddleCard
            Flexible(
              //flex: 1,
              
              child: Padding(
                padding: EdgeInsets.only(
                  left: width * 0.05, 
                  right: height * 0.02,
                  top: height * 0.05
                ),
                child: Container(
                  height: height * 0.26,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TicketsSummary(),
                ),
              ),
            ),
            // DashboardMenu - Con scroll
            Expanded(
              //flex: 2,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: DashboardMenu(),
              ),
            ),
          ],
        );
      },
    ),
  );
        
      
      /* appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon( Icons.search_rounded)
          )
        ],
      ), */
     /*  body:  Stack(
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
      ) */
    
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
