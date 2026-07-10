import 'package:flutter/material.dart';

import 'berita_page.dart';
import 'movies_list.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  final List<Widget> pages = const [

    MoviesList(),

    BeritaPage(),

    ProfilePage(),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentIndex,

        selectedItemColor: Colors.blue,

        onTap: (index){

          setState(() {

            currentIndex = index;

          });

        },

        items: const [

          BottomNavigationBarItem(

            icon: Icon(Icons.home),

            label: "Home",

          ),

          BottomNavigationBarItem(

            icon: Icon(Icons.newspaper),

            label: "Berita",

          ),

          BottomNavigationBarItem(

            icon: Icon(Icons.person),

            label: "Profil",

          ),

        ],

      ),

    );

  }

}