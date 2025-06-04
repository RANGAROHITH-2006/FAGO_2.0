import 'package:flutter/material.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

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
            Image.asset('assets/click.png'),
            Text('Payment Successful',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text('ThankYou for Ordering'),
            Text('Your Payment is Successfully Completed'),
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
             child: Text('Go To HomePage',style: TextStyle(color: Colors.white),))
        ],
      ),),
    );
  }
}