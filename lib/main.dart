import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proje/services/auth_service.dart';
import 'package:proje/kitap_ekle.dart';
import 'package:proje/KategorilerSayfa.dart';
import 'package:proje/login_page.dart';

import 'package:proje/search.dart';
import 'package:proje/sozluk.dart';
import 'package:proje/profilim.dart';
import 'package:firebase_core/firebase_core.dart';

import 'okudugum_kitaplar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

var secenekler = [];
late AuthService _service;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service =AuthService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: [ElevatedButton(onPressed: (){
_service.signOut();
Navigator.pop(context);
        }, child: Text("Çıkış"))],
      ),
    
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2/3,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => SearchPage())));
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search),
                  Text("Kitap Ara"),
                ],
              ),
            ),
          ),
           GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => KategorilerSayfa()));
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.book),
                  Text("Tavsiye Kitaplar"),
                ],
              ),
            ),
          ),
          
          
          
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => kisi_ekle()));
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.abc),
                  Text("Sözlük"),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              
              Navigator.push(context, MaterialPageRoute(builder: ((context) => KitapListe())));
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.book_rounded),
                  Text("Okuduğum Kitaplar"),
                ],
              ),
            ),
          ),
          
           GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => KitapEkle()));
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.blueGrey,),
                  Text("Kitap Ekle"),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => gununSozu()));
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.abc),
                  Text("Gunun Sozu"),
                ],
              ),
            ),
          ),
          
         
         
        ],
      ),
    );
  }
}
