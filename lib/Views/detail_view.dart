import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar()),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.red,
          height: 100,
          width: 100,
          child: Text("Data"),
        ),
      ),
    );
  }
}
