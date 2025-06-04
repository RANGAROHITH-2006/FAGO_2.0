import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodCart extends StatelessWidget {
  FoodCart({super.key});

  final List<Map<String, String>> foodList = [
    {
      'name': 'Chicken Roast',
      'price': '₹300',
      'image': 'assets/images/restaurant/s1.png',
    },
    {
      'name': 'Full Meals',
      'price': '₹240',
      'image': 'assets/images/restaurant/s2.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 40),
            SizedBox(width: 8),
            Text('FAGO', style: TextStyle(color: Colors.orange[800])),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          final item = foodList[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item['image']!,
                width: 120,
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
            title: Text(
              item['name']!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['price']!, style: TextStyle(color: Colors.green)),
                Row(
                  children: [
                    Icon(Icons.star, size: 15, color: Colors.amber),
                    Text('4.4', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
          ),
          Divider(height: 40),
      Container(
        child:Row(
            children: [
              Text('Order Total',style: TextStyle(fontSize: 20),),
              Spacer(),
              Column(
                children: [
                  Text('800.00'),
                  ElevatedButton(onPressed: (){}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[800],
                    foregroundColor: Colors.white,
                  
                  ),
                  child: Text('Place Order'))
                ],
              )
            ],
        ),
      ),
           Container(child:  BottomAppBar(
        height: 180,
      color: Colors.amber[800],
        child:Padding(padding: EdgeInsets.all(8.0),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo1.png',height: 50,),
                Text('FAGO',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)
              ],
            ),
            Text('The only thing we are serious about is food.',style: TextStyle(fontSize: 15,color: Colors.white),),
            Text('Contact us on',style: TextStyle(fontSize: 15,color: Colors.white),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.pinterest, color: Colors.white)),
                  IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.white)),
                  IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.white)),
                  IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.facebookF, color: Colors.white)),
                ],
            )
        ],
      ),
      ),)
      
      ),
      
        ],
      ) 
      );
    
  }
}
