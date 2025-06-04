import 'package:fago/Homepage/HomePage.dart';
import 'package:fago/screens/supabase/Authentication/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              'Account',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Divider(height: 80),

            Row(
              children: [
                 Text(
              'Member ship',
              style: TextStyle(fontSize:20,color: Colors.blueGrey),
            ),
            SizedBox(width: 20),
            Column(

                  children: [
                    Text('rahul@gmail.com',style: TextStyle(fontSize:20,)),
                    SizedBox(height: 10),
                    Text('Password : **********',style: TextStyle(fontSize:20,)),
                  ],
            )
            
              ],
            ),
            Divider(height: 80),
            Row(
              children: [
                   Text(
              'Plan details',
              style: TextStyle(fontSize:20,color: Colors.blueGrey),
            ),
            SizedBox(width: 20),
            Row(
              children: [
                Text('Premium',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Ultra HD',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
              ],
            ),
          Divider(height: 80),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>loginpagescreen()));

                },
                child: Text('Logout', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
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



