import 'package:flutter/material.dart';
import 'package:linio_app/services/favorited_service.dart';
import 'package:provider/provider.dart';

class GridProducts extends StatelessWidget {
  final products;
  const GridProducts({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BackgroundCard(
      child: ChangeNotifierProvider(
        create: (context) => FavoritedService(),
        child: Stack(children: [
          Positioned(
            right: 11,
            top: 11,
            child: _FavoriteIcon(
              isFavorited: products['isFavorite'],
            ),
          ),
          _CardImageProduct(imageProduct: products['picture']),
          _DescriptionProduct(
            nameProduct: products['nombre'],
            priceProduct: products['price'],
          )
        ]),
      ),
    );
  }
}

class _DescriptionProduct extends StatelessWidget {
  final nameProduct;
  final priceProduct;
  const _DescriptionProduct({
    Key? key,
    required this.nameProduct,
    required this.priceProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 142),
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nameProduct,
            style: TextStyle(fontSize: 17),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '\$ $priceProduct',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class _CardImageProduct extends StatelessWidget {
  final imageProduct;
  const _CardImageProduct({
    Key? key,
    required this.imageProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 45),
      width: double.infinity,
      height: 100,
      child: Image.asset(
        imageProduct,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _FavoriteIcon extends StatelessWidget {
  final bool isFavorited;

  const _FavoriteIcon({Key? key, required this.isFavorited}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favorite = Provider.of<FavoritedService>(context);
    return GestureDetector(
      onTap: () {
        if (favorite.isFavoritedGet == isFavorited) {
          favorite.isFavoritedSet = true;
        } else if (favorite.isFavoritedGet == true) {
          favorite.isFavoritedSet = false;
        }
      },
      child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
          child: (favorite.isFavoritedGet)
              ? const Icon(
                  Icons.favorite,
                  size: 25,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.favorite_border,
                  size: 23,
                  color: Colors.red,
                )),
    );
  }
}

class _BackgroundCard extends StatelessWidget {
  final Widget child;
  const _BackgroundCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(232, 199, 222, 1),
                Color.fromRGBO(210, 200, 222, 1),
              ])),
      child: child,
    );
  }
}
