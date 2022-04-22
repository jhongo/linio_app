import 'package:flutter/material.dart';

class TitleOutboarding extends StatelessWidget {
  const TitleOutboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: 250,
      // color: Colors.indigo,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'CYBER',
            style: TextStyle(
                fontSize: 60,
                color: Color.fromRGBO(236, 190, 92, 90),
                fontWeight: FontWeight.bold),
          ),
          const Text(
            'LINIO',
            style: TextStyle(
                fontSize: 60,
                color: Color.fromRGBO(236, 190, 92, 90),
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  '40%',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 50,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'DCTO',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
          const Text(
            'en tecnología',
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1), fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          const Text(
            'ENVIO GRATIS',
            style: TextStyle(
                color: Color.fromRGBO(236, 190, 92, 90), fontSize: 15),
          ),
        ],
      ),
    );
  }
}
