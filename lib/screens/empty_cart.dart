import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        actions: [
        
         Image.asset('assets/logo.png'),
         Text('FAGO',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.amber[800]),),
         Spacer(),
         IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
      ],
      ),
      body: Padding(padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget> [
            Image.asset('assets/empty.png'),
            SizedBox(height: 
            10),
            Text('No Orders Yet!',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text('Your cart is empty. Add somthing'),
            Text('from the menu.'),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: (){},
             style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange,      
    foregroundColor: Colors.white,       
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
             child: Text('Order Now',style: TextStyle(color: Colors.white),))
        ],
      ),),
    );
  }
  }
