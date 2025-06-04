import 'package:fago/Homepage/HomePage.dart';
import 'package:fago/screens/self_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Restaurantscreen extends StatelessWidget {
   Restaurantscreen({super.key});

  final List<Map<String, String>> FoodList = [
    {
      'image': 'assets/images/restaurant/r1.png',
      'name': "McDonald's",
      'type': 'Fast Food',
    },
    {
      'image': 'assets/images/restaurant/r2.png',
      'name': 'SVS Paradise',
      'type': 'Fast Food',
    },
    {
      'image': 'assets/images/restaurant/r3.png',
      'name': 'Subway',
      'type': 'Fast Food',
    },
    {
      'image': 'assets/images/restaurant/r4.png',
      'name': 'Veg King',
      'type': 'Fast Food',
    },
    {
      'image': 'assets/images/restaurant/r5.png',
      'name': 'Pizza Hut',
      'type': 'Fast Food',
    },
    {
      'image': 'assets/images/restaurant/r6.png',
      'name': 'Freezing Hub',
      'type': 'Fast Food',
    },
    {
      'image': 'assets/images/restaurant/r7.png',
      'name': 'Veg King',
      'type': 'Fast Food',
    },
    {
      'image': 'assets/images/restaurant/r8.png',
      'name': 'Pizza Hut',
      'type': 'Fast Food',
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        actions: [
         IconButton(onPressed: (){
           Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) =>  Homepage()),
    );
         }, icon: Icon(Icons.arrow_back)),
         Image.asset('assets/logo.png'),
         Text('FAGO',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.amber[800]),),
         Spacer(),
         IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
      ],
      ),
      body: ListView.builder(
        itemCount: FoodList.length,
        itemBuilder: (context, index) {
          final item = FoodList[index];
          return  GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>SelfPage(item['name']!),
          ),
        );
      },
      child: Card(
        child:  ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item['image']!,
                width: 120,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(item['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['type']!),
                Row(
                  children: <Widget> [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text('4.4 (222 ratings)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,)),
                  ],
                ),
              ],
            ),
            isThreeLine: true,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          
      ),
    ));
  },
),
          
      bottomNavigationBar: BottomAppBar(
        height: 160,
      color: Colors.amber[800],
        child:Padding(padding: EdgeInsets.all(8.0),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo1.png',height: 40,),
                Text('FAGO',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
              ],
            ),
            Text('The only thing we are serious about is food.',style: TextStyle(fontSize: 10,color: Colors.white),),
            Text('Contact us on',style: TextStyle(fontSize: 10,color: Colors.white),),
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
      ),
      
      ),
      
    );
  }
}

