import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget buildItem(
      IconData icon,
      String title,
      String value) {

    return Card(

      elevation: 3,

      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),

      child: ListTile(

        leading: Icon(

          icon,

          color: Colors.blue,

        ),

        title: Text(title),

        subtitle: Text(

          value,

          style: const TextStyle(

            fontWeight: FontWeight.bold,

          ),

        ),

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text("Profil Mahasiswa"),

        centerTitle: true,

      ),

      body: Padding(

        padding: const EdgeInsets.all(15),

        child: ListView(

          children: [

            const CircleAvatar(

              radius: 60,

              backgroundColor: Colors.blue,

              child: Icon(

                Icons.person,

                color: Colors.white,

                size: 70,

              ),

            ),

            const SizedBox(height: 20),

            buildItem(
              Icons.person,
              "Nama",
              "GANTI DENGAN NAMA ANDA",
            ),

            buildItem(
              Icons.badge,
              "NIM",
              "GANTI DENGAN NIM",
            ),

            buildItem(
              Icons.school,
              "Program Studi",
              "Informatika",
            ),

            buildItem(
              Icons.apartment,
              "Universitas",
              "Nama Universitas",
            ),

            buildItem(
              Icons.book,
              "Mata Kuliah",
              "Pemrograman Aplikasi Mobile",
            ),

          ],

        ),

      ),

    );

  }

}