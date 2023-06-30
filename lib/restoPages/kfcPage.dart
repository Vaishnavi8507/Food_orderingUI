import 'package:flutter/material.dart';
class KFCPage extends StatefulWidget {
  const KFCPage({Key? key}) : super(key: key);

  @override
  State<KFCPage> createState() => _KFCPageState();
}

class _KFCPageState extends State<KFCPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 90.0,
          color: Colors.pink,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.all(12.0),
              child:Image.asset('assets/images/kfclogo.png',
                width: 50.0,
                height: 50.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(16.0),
          color: Colors.white,
          child: Text(
            'Welcome to KFC',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
