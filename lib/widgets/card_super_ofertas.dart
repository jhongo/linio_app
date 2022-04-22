import 'package:flutter/material.dart';
import 'package:linio_app/models/categories.dart';

class CardSuperOferta extends StatefulWidget {
  final data;

  CardSuperOferta({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<CardSuperOferta> createState() => _CardSuperOfertaState();
}

class _CardSuperOfertaState extends State<CardSuperOferta>
    with SingleTickerProviderStateMixin {
  // DECLARA LAS FUNCIONALIDADES DE LAS ANIMACIONES
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> traslacionDerecha;
  late Animation<double> traslacionIzquierda;
  late Animation<double> traslacionArriba;
  late Animation<double> traslacionAbajo;
  // INICIALIZA LA ANIMACION
  @override
  void initState() {
    //INICIO DEL CONTROLLER
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));

    // Rotacion del LOS PRODUCTOS DE SUPER OFERTAS
    rotacion = Tween(begin: 0.0, end: 2.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    // Movimiento hacia la DERECHA
    traslacionDerecha = Tween(begin: 0.0, end: 300.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    // Movimiento hacia la IZQUIERDA
    traslacionIzquierda = Tween(begin: 0.0, end: -300.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    //Saltos
    traslacionArriba = Tween(begin: 0.0, end: -10.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutQuint));
    traslacionAbajo = Tween(begin: 0.0, end: 10.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutQuint));

    // DETERMINAR EL ESTADO DE LA ANIMACION
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.stop();
      }
    });

    super.initState();
  }

  // SE DETERMINA EL CICLO DE LA ANIMACION
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    controller.forward();

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget) {
          return Transform.translate(
            offset: Offset(traslacionIzquierda.value + traslacionDerecha.value,
                traslacionArriba.value + traslacionAbajo.value),
            // Widget ANIMADO
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: size.width * 0.43,
              height: 198,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    stops: [2, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(231, 231, 229, 1),
                      Color.fromRGBO(239, 238, 237, 1),
                    ]),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    _TagEnvio(
                      envio: widget.data['envio'],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _PictureProduct(
                      picture: widget.data['picture'],
                    ),
                    _TextDescription(
                      nameProduct: widget.data['nombre'],
                      priceProduct: widget.data['price'],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class _TagEnvio extends StatelessWidget {
  final envio;
  const _TagEnvio({Key? key, required this.envio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 10, top: 10),
        width: 90,
        height: 20,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(66)),
        child: Text(
          envio,
          style: const TextStyle(
              color: Color.fromRGBO(237, 106, 49, 1),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class _PictureProduct extends StatelessWidget {
  final picture;
  const _PictureProduct({Key? key, required this.picture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.09,
      alignment: Alignment.center,
      child: Image.asset(
        picture,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _TextDescription extends StatelessWidget {
  final nameProduct;
  final priceProduct;
  const _TextDescription(
      {Key? key, required this.nameProduct, this.priceProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        child: Container(
          padding: EdgeInsets.only(left: 20, top: 10),
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameProduct,
                style: TextStyle(fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '\$$priceProduct',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
