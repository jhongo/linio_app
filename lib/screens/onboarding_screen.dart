import 'package:flutter/material.dart';
import 'package:linio_app/screens/main_screen.dart';
import 'package:linio_app/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardignScreen extends StatelessWidget {
  const OnboardignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundOutboarding(
            child: Stack(
      children: [
        const Positioned(top: 100, left: 70, child: TitleOutboarding()),
        const Positioned(
            top: 170,
            right: 50,
            child: Image(image: AssetImage('assets/lightning.png'))),
        const Positioned(
            top: 380,
            left: 30,
            child: Image(image: AssetImage('assets/macbook_pro.png'))),
        const Positioned(
            bottom: 230,
            right: 70,
            child: Image(image: AssetImage('assets/white-hero.png'))),
        const Positioned(
            bottom: 330,
            right: 75,
            child: Image(image: AssetImage('assets/nintendo_switch.png'))),
        const Positioned(
            left: 35,
            bottom: 295,
            child: Image(image: AssetImage('assets/alexa_parlante.png'))),
        const Positioned(
            bottom: 230,
            left: 115,
            child: Image(image: AssetImage('assets/au-galaxy.png'))),
        const Positioned(
            top: 330,
            right: 45,
            child: Image(image: AssetImage('assets/headphones.png'))),
        Positioned(
            child: Column(
          children: [
            Expanded(child: Container()),
            Container(
              width: double.infinity,
              height: 220,
              child: Column(
                children: const [
                  _titlePromocion(),
                  SizedBox(
                    height: 30,
                  ),
                  _ButtonInicioSesion(),
                  SizedBox(
                    height: 30,
                  ),
                  _Points(),
                  SizedBox(
                    height: 30,
                  ),
                  _buttonOmitir()
                ],
              ),
            )
          ],
        ))
      ],
    )));
  }
}

class _buttonOmitir extends StatelessWidget {
  const _buttonOmitir({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.centerRight,
      child: Text(
        'OMITIR',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class _Points extends StatelessWidget {
  const _Points({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        _Point(),
        _Point(),
        _Point(),
      ]),
    );
  }
}

class _ButtonInicioSesion extends StatelessWidget {
  const _ButtonInicioSesion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
          color: Colors.white,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          height: 60,
          minWidth: 330,
          child: const Text(
            'INICIAR SESION',
            style:
                TextStyle(color: Color.fromRGBO(237, 97, 42, 1), fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(context, _createRoute());
          }),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: Duration(seconds: 2),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curveAnimated =
            CurvedAnimation(parent: animation, curve: Curves.easeInOut);
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(-0.5, 1.0), end: Offset.zero)
              .animate(curveAnimated),
          child: child,
        );
        // return FadeTransition(
        //   opacity: Tween(begin: 0.5, end: 1.0).animate(curveAnimated),
        //   child: child,
        // );
        // return ScaleTransition(
        //   scale: Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimated),
        //   child: child,
        // );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return MainScreen();
      },
    );
  }
}

class _titlePromocion extends StatelessWidget {
  const _titlePromocion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        '*Válido del 27/03 al 01/04 del 2022. Stock min: 1 unidad',
        style: TextStyle(color: Colors.white, fontSize: 9),
      ),
    );
  }
}

class _Point extends StatelessWidget {
  const _Point({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.white),
    );
  }
}
