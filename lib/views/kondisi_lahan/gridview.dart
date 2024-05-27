import 'package:flutter/material.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class GridDataSensor extends StatelessWidget {
  // const GridDataSensor({super.key});

  Items item1 = Items(
    title: "Calendar", 
    subtitle: "March, Wednesday", 
    event: "3 Events", 
    img: "assets/images/cerahberawan.png"
  );

  Items item2 = Items(
    title: "Calendar", 
    subtitle: "March, Wednesday", 
    event: "3 Events", 
    img: "assets/images/cerahberawan.png"
  );

  Items item3 = Items(
    title: "Calendar", 
    subtitle: "March, Wednesday", 
    event: "3 Events", 
    img: "assets/images/cerahberawan.png"
  );

  Items item4 = Items(
    title: "Calendar", 
    subtitle: "March, Wednesday", 
    event: "3 Events", 
    img: "assets/images/cerahberawan.png"
  );

  Items item5 = Items(
    title: "Calendar", 
    subtitle: "March, Wednesday", 
    event: "3 Events", 
    img: "assets/images/cerahberawan.png"
  );

  Items item6 = Items(
    title: "Calendar", 
    subtitle: "March, Wednesday", 
    event: "3 Events", 
    img: "assets/images/cerahberawan.png"
  );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({required this.title, required this.subtitle, required this.event, required this.img});
}