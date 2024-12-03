import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,

      decoration: const BoxDecoration(
        color:  Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70)
        )
      ),
    );
  }
}


class Headerdiagonal extends StatelessWidget {
  const Headerdiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz =  Paint();
    //Propiedades
    lapiz.color = const  Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2;

    final path =  Path();

    //Dibujar con el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    //path.lineTo(0, size.height * 0.5);
    
   

    canvas.drawPath(path, lapiz);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}


class _HeaderTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz =  Paint();
    //Propiedades
    lapiz.color = const  Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2;

    final path =  Path();

    //Dibujar con el lapiz
    //path.moveTo(0, 0);
    path.lineTo(size.width, size.height );
    path.lineTo(0, size.height);
    //path.lineTo(0, 0);
    //path.lineTo(0, size.height * 0.5);
    
   

    canvas.drawPath(path, lapiz);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}


class _HeaderPicoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz =  Paint();
    //Propiedades
    lapiz.color = const  Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 2;

    final path =  Path();

    //Dibujar con el lapiz
   
    path.lineTo(0, size.height * 0.25 );
    path.lineTo(size.width * 0.5, size.height * 0.30 );
    path.lineTo(size.width, size.height * 0.25 );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}


class _HeaderCurvoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz =  Paint();
    //Propiedades
    lapiz.color = const  Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path =  Path();

    //Dibujar con el lapiz
   
    path.lineTo(0, size.height * 0.25 );
    //path.lineTo(size.width, size.height * 0.25 );
    path.quadraticBezierTo(size.width  * 0.50, size.height * 0.40, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
   

    canvas.drawPath(path, lapiz);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderWaves extends StatelessWidget {
  const HeaderWaves({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWavesPainter(),
      ),
    );
  }
}


class _HeaderWavesPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz =  Paint();
    //Propiedades
    lapiz.color = const  Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path =  Path();

    //Dibujar con el lapiz
   
    path.lineTo(0, size.height * 0.25 );
    //path.lineTo(size.width, size.height * 0.25 );
    path.quadraticBezierTo(size.width  * 0.25, size.height * 0.30, size.width * 0.50, size.height * 0.25);
    path.quadraticBezierTo(size.width  * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
   

    canvas.drawPath(path, lapiz);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  

}






class HeaderGradientWaves extends StatelessWidget {
  const HeaderGradientWaves({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWavesGradientPainter(),
      ),
    );
  }
}


class _HeaderWavesGradientPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(center: const Offset(0, 55.0), radius: 180);

    const Gradient gradient =   LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ],
      stops: [
        0.2,
        0.5,
        1.0
      ]
    
      
    );
    final lapiz =  Paint()..shader = gradient.createShader(rect);
    //Propiedades
    lapiz.color = const  Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path =  Path();

    //Dibujar con el lapiz
   
    path.lineTo(0, size.height * 0.25 );
    //path.lineTo(size.width, size.height * 0.25 );
    path.quadraticBezierTo(size.width  * 0.25, size.height * 0.30, size.width * 0.50, size.height * 0.25);
    path.quadraticBezierTo(size.width  * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
   

    canvas.drawPath(path, lapiz);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  

}


class IconHeader extends StatelessWidget {

  final IconData icon;
  final String title;
  final String subtitulo;
  final Color color1;
  final Color color2;
  const IconHeader({
    super.key, 
    required this.icon, 
    required this.title, 
    this.subtitulo = '', 
    this.color1 = Colors.grey, 
    this.color2 = Colors.blueGrey
  });

  @override
  Widget build(BuildContext context) {

    final Color colorBlanco = const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7);
    

    return  Stack(
      children: [
        _IconHeaderBackground(
          color1: color1,
          color2: color2
        ),

        Positioned(
          top: -30,
          left: -30,
          child: FaIcon(icon, size: 180, color: Colors.white.withOpacity(0.2),)
        ),
        Column(
          children: <Widget> [
            const SizedBox(height: 60,width: double.infinity,),
            Text(title, style: TextStyle(
              fontSize: 25, 
              color: colorBlanco,
              shadows: [
                Shadow(
                  offset:const  Offset(2.0,2.0),
                  blurRadius: 3.0,
                  color: Colors.black.withOpacity(0.5)

                )
              ]
            ),
          ),
            const SizedBox(height: 20,),
            Text(subtitulo, style: TextStyle(
              fontSize: 15, 
              color: colorBlanco, 
              fontWeight: FontWeight.bold, 
              shadows: [
                Shadow(
                  offset:const  Offset(2.0,2.0),
                  blurRadius: 3.0,
                  color: Colors.black.withOpacity(0.5)

                )
              ]
            ),
          ),
            const SizedBox(height: 20,),
            //FaIcon(icon, size: 80, color: Colors.white,)
          ]
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  final Color color1;
  final Color color2;
  const _IconHeaderBackground({required this.color1, required this.color2}
    
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        //color: Colors.red,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color> [
            color1,
            color2
          //  Color(0xff526BF6),
          //  Color(0xff67ACF2),
          ]
        )
      ),
    );
  }
}


