import 'package:flutter/material.dart';
import 'package:newlogin/restoPages/cakePage.dart';
import 'package:newlogin/restoPages/kfcPage.dart';
import 'package:newlogin/restoPages/mcPage.dart';
import 'package:newlogin/restoPages/noodlePage.dart';
import 'package:newlogin/restoPages/pizzaPage.dart';

class FoodSearch extends StatefulWidget {
  final String query;
  const FoodSearch({Key? key, required this.query}) : super(key: key);

  @override
  State<FoodSearch> createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearch>{
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        title: Text('Food Search'),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/vj.jpeg'),
          ),
          SizedBox(width: 8.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for dishes and restaurants',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 16.0,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>KFCPage()),
                );
              },
              child:FloatingCard(
              image:AssetImage('assets/images/kfc.png'),
              title:'KFC',
              description: 'Burgers, Biryani, American....,'
                  'Vijay Nagar-7.5km',
            ),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap:() {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DonaldsPage()),
                );
              },
              child:FloatingCard(
              image:AssetImage('assets/images/mc.png'),
              title:'Mc Donalds',
              description: 'Burgers, Beverages, Cafe Delight,'
                  'Chamrajpura-11.8km',
            ),
            ),
            SizedBox(height: 16.0),

      GestureDetector(
          onTap:() {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => CakePage()),
            );
          },
          child:FloatingCard(
            image:AssetImage('assets/images/cake.png'),
            title:'Cake Room',
              description: 'Desserts ,Kuvempunagar-11.3km',
            ),
      ),
            SizedBox(height: 16.0),
      GestureDetector(
          onTap:() {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => NoodlePage()),
            );
          },
          child: FloatingCard(
              image:AssetImage('assets/images/noodle.png'),
              title:'The Noodle Theory',
              description: 'Chinese, Italian, Indian,'
                'Gokulam-10.6km',
            ),
      ),
            SizedBox(height: 16.0),

      GestureDetector(
          onTap:() {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => PizzaPage()),
            );
          },
          child: FloatingCard(
              image:AssetImage('assets/images/pizza.png'),
              title:'Oven Story',
              description: 'Pizzas, Pastas, Italian, Desserts,'
                  ' Vijayanagar-8.0km',
            ),
      ),
            SizedBox(height: 16.0),


          ],
        ),
      ),
    );
  }
}
class FloatingCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;

  const FloatingCard({Key? key,required this.title,required this.image, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
         /* BoxShadow(
            color: Colors.blueAccent.withOpacity(0.1),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),*/
        ],
      ),
      child:Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image(image: image,fit: BoxFit.cover,
        height: 100.0,
        width: 100.0,
        ),
    ),
    Expanded(
    child: Container(
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.horizontal(right: Radius.circular(8.0)),
    color: Colors.white,
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    ),
    ),
    SizedBox(height: 8.0),
    Text(
    description,
    style: TextStyle(
   // color: Colors.grey,
    ),
    )
    ],
    ),
      ),
    ),
    ],
      ),
    );
  }
}

