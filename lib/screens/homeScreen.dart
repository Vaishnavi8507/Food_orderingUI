import 'package:flutter/material.dart';
import 'package:newlogin/pages/cart.dart';
import 'package:newlogin/pages/foodSearch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex=0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
    switch(index){
      case 0:Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
      break;
      case 1:Navigator.push(context,MaterialPageRoute(builder: (context)=>FoodSearch(query: '',)));
      break;
      case 2:Navigator.push(context,MaterialPageRoute(builder: (context)=>Cart()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(
          "Foodie",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/vj.jpeg'),
          ),
          SizedBox(width: 8.0),
        ],
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for dishes restaurants ',
                  prefixIcon: Icon(Icons.search),
                ),

              )
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem( icon:Icon(Icons.home),
            label:'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_outlined),
            label: 'Food Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purpleAccent,
        onTap: _onItemTapped,
      ),

    );
  }
}

