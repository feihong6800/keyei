import 'dart:html';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:keyei/view_model/home_vm.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeVM _homeVM = HomeVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'HOME',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: const Column(
          children: [

          ],
        ),
      ),
    );
  }
}
