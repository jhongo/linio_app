import 'package:flutter/material.dart';
import 'package:linio_app/widgets/widgets.dart';

class BannerMain extends StatelessWidget {
  const BannerMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        height: 225,
        child: Stack(
          children: [
            const _BackgroundBannerMain(),
            const Positioned(left: 40, top: 35, child: _TitleBannerMain()),
            Positioned(
                top: -11,
                left: 115,
                child: Image.asset('assets/adaptative.png')),
            Positioned(
                top: -1,
                right: 15,
                child: Image.asset('assets/nintendo_switch.png')),
            Positioned(
                bottom: 0,
                right: 12,
                child: Image.asset('assets/au-galaxy.png')),
          ],
        ));
  }
}

class _BackgroundBannerMain extends StatelessWidget {
  const _BackgroundBannerMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(176, 41, 136, 1),
            Color.fromRGBO(82, 26, 136, 1),
          ]),
          borderRadius: BorderRadius.circular(30)),
    );
  }
}

class _TitleBannerMain extends StatelessWidget {
  const _TitleBannerMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'CYBER',
            style: TextStyle(
                color: Color.fromRGBO(236, 190, 92, 1),
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            'LINIO',
            style: TextStyle(
                color: Color.fromRGBO(236, 190, 92, 1),
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: const [
              Text(
                '40%',
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'DCTO',
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const Text(
            'en tecnología',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            elevation: 0,
            color: Color.fromRGBO(255, 255, 255, 1),
            child: const Text(
              'ENVIO GRATIS',
              style: TextStyle(color: Color.fromRGBO(236, 190, 92, 1)),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
