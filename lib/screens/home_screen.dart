import 'package:flutter/material.dart';
import 'package:linio_app/models/categories.dart';
import 'package:linio_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  List category = categories;
  List ofertas = super_ofertas;
  List vistos = vistos_recientes;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromRGBO(247, 246, 244, 1),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: const [
                          _SearchContainer(),
                          _NotificationIcon(),
                        ],
                      ),
                    ),
                    const BannerMain(),
                    const SizedBox(height: 10),
                    _ItemsCategories(category: category),
                    const SizedBox(height: 15),
                    const TitleOfertas(
                      title: 'Super Ofertas',
                    ),
                    _CardOfertas(ofertas: ofertas),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(height: 15),
                    const TitleOfertas(
                      title: 'Visto recientemente',
                    ),
                    const SizedBox(height: 15),
                    _GridContainer(
                      size: size,
                      children: List.generate(
                          vistos.length,
                          (index) => GridProducts(
                                products: vistos[index],
                              )),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class _GridContainer extends StatelessWidget {
  final List<Widget> children;
  final Size size;

  const _GridContainer({
    Key? key,
    required this.size,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: size.height * 0.50,
      child: GridView(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 210.5,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0,
              childAspectRatio: 50.0),
          children: children),
    );
  }
}

class _CardOfertas extends StatelessWidget {
  const _CardOfertas({
    Key? key,
    required this.ofertas,
  }) : super(key: key);

  final List ofertas;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15),
        height: 198,
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  ofertas.length,
                  (index) => CardSuperOferta(
                        data: ofertas[index],
                      )),
            ),
          ),
        ));
  }
}

class TitleOfertas extends StatelessWidget {
  final String title;
  const TitleOfertas({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _ItemsCategories extends StatelessWidget {
  const _ItemsCategories({
    Key? key,
    required this.category,
  }) : super(key: key);

  final List category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(
                category.length, (i) => _CategoryItem(name: category[i]))),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final name;
  const _CategoryItem({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(name['categorie']);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 110,
        height: 30,
        decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromRGBO(231, 231, 231, 1), width: 1),
            borderRadius: BorderRadius.circular(100),
            color: Color.fromRGBO(255, 255, 255, 1)),
        child: Text(
          name['nombre'],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _SearchContainer extends StatelessWidget {
  const _SearchContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
          child: Row(
            children: const [
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.search,
                size: 40,
                color: Color.fromRGBO(207, 207, 207, 1),
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                'Buscar en Linio',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(207, 207, 207, 1),
                ),
              )
            ],
          )),
    );
  }
}

class _NotificationIcon extends StatelessWidget {
  const _NotificationIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 20),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(100)),
      child: Stack(
        children: [
          const Icon(
            Icons.notifications_outlined,
            color: Color.fromRGBO(207, 207, 207, 1),
            size: 35,
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(100)),
            ),
          )
        ],
      ),
    );
  }
}
