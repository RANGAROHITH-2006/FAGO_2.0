import 'package:fago/Homepage/account_screen.dart';
import 'package:fago/Homepage/restaurantScreen.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> _pages = [MainHomePage(), MainHomePage(), MainHomePage()];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: Color.fromRGBO(242, 164, 62, 1),
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                text: "Home",
                icon: Icons.home,
                selected: _selectedIndex == 0,
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
              ),
              IconBottomBar(
                text: "Reataurant",
                icon: Icons.restaurant,
                selected: _selectedIndex == 1,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Restaurantscreen()),
                  );
                },
              ),
              IconBottomBar(
                text: "Map",
                icon: Icons.map,
                selected: _selectedIndex == 2,
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
              ),
              IconBottomBar(
                text: "Profil",
                icon: Icons.person,
                selected: _selectedIndex == 3,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(235, 157, 55, 1),
            Color.fromRGBO(241, 202, 145, 1),
            Color.fromRGBO(248, 218, 173, 1),
            Color.fromRGBO(242, 227, 206, 1),
            Color.fromRGBO(245, 243, 242, 1),
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(),
            const SearchInput(),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/promocard.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                ),
              ),
            ),
            FoodItems(),
            SizedBox(height: 10),
            Padding(padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular Franchise',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Restaurantscreen()));
          },child: Text('View All',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                )
            ],),
            ),
            
            
            PopularFood(),
          ],
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onTap;
  final bool selected;

  const IconBottomBar({
    super.key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  get kPrimayColor => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(icon, color: selected ? kPrimayColor : Colors.grey),
        ),
        Text(
          text,
          style: TextStyle(color: selected ? kPrimayColor : Colors.grey[800]),
        ),
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Find Your\nFavorite Food',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(12, 16),
                    blurRadius: 50,
                    spreadRadius: 0,
                    color: Colors.grey.withOpacity(.25),
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.food_bank,
                  size: 30,
                  color: Color.fromARGB(255, 169, 62, 230),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.15),
            ),
          ],
        ),
        child: TextFormField(
          onChanged: (value) {},
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

class FoodItems extends StatelessWidget {
  FoodItems({super.key});

  final List<Map<String, String>> categories = [
    {"name": "Biryani", "image": "assets/images/restaurant/B1.png"},
    {"name": "North Indian", "image": "assets/images/restaurant/r2.png"},
    {"name": "Burger", "image": "assets/images/restaurant/r1.png"},
    {"name": "Snacks", "image": "assets/images/restaurant/s5.png"},
    {"name": "Pizza", "image": "assets/images/restaurant/r7.png"},
    {"name": "Chinese", "image": "assets/images/restaurant/N1.png"},
    {"name": "South Indian", "image": "assets/images/restaurant/s3.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          final item = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(
                    item['image']!,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 6),
                Text(item['name']!, style: TextStyle(fontSize: 13)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PopularFood extends StatelessWidget {
   PopularFood({super.key});
  
   final List<Map<String, String>> Popular = [
    {
      'image': 'assets/Mc.png',
      'name': "McDonald's",
      'type': 'Fast Food',
    },
    {
      'image': 'assets/KFC.png',
      'name': 'KFC',
      'type': 'Fast Food',
    },
    {
      'image': 'assets/Dominos.png',
      'name': 'Domino`s Pizza',
      'type': 'Pizza House',
    },
    {
    'image': 'assets/Mefil.png',
      'name': 'Mefil',
      'type': 'Restaurant',
    },
    {
      'image': 'assets/paradise.png',
      'name': 'Paradise',
      'type': 'Restaurant',

    },{
    'image': 'assets/images/restaurant/r3.png',
      'name': 'Subway',
      'type': 'Fast Food',
    }
    ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child:GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, 
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 4, 
      ),
      itemCount: Popular.length, 
      itemBuilder: (context, index) {
        final item = Popular[index]; 

        return GestureDetector(
          onTap: () {
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.asset(
                      item['image']!, 
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['type']!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
