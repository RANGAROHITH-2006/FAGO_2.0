import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelfPage extends StatelessWidget {
  final String Name;
  SelfPage(this.Name,{super.key});

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
    {
      'name': 'Subbaya Full Meals',
      'price': '₹160',
      'image': 'assets/images/restaurant/s3.png',
    },
    {
      'name': 'Samosa (2)',
      'price': '₹50',
      'image': 'assets/images/restaurant/s5.png',
    },
    {
      'name': 'Udupi Chapati (3)',
      'price': '₹120',
      'image': 'assets/images/restaurant/s4.png',
    },
    {
      'name': 'Egg Toast',
      'price': '₹60',
      'image': 'assets/images/restaurant/s6.png',
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
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/mclogo.png',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${Name}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'North Indian, Fast Food, Smoky...',
                        style: TextStyle(color: Colors.grey[300], fontSize: 12),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          SizedBox(width: 4),
                          Text('4.4', style: TextStyle(color: Colors.white)),
                          SizedBox(width: 12),
                          Text(
                            '300+ Ratings',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                final item = foodList[index];
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
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
                      Text(
                        item['price']!,
                        style: TextStyle(color: Colors.green),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, size: 15, color: Colors.amber),
                          Text(
                            '4.4',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.orange, width: 2),
                          foregroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('ADD'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Container(
            child: BottomAppBar(
              height: 180,
              color: Colors.amber[800],
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/logo1.png', height: 50),
                        Text(
                          'FAGO',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'The only thing we are serious about is food.',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Text(
                      'Contact us on',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.pinterest,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.twitter,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
