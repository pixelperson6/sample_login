
import 'package:flutter/material.dart';

enum BookGenre {
  romance('Romance',Colors.green),
  fantasy('Fantasy',Colors.yellow),
  horror('Horror',Colors.pink),
  scifi('Sci-fi',Colors.black),
  mystery('Mystery',Colors.white),
  thriller('Thriller',Colors.amber),
  financial('Financial',Colors.grey),
  selfHelp('Self-Help',Colors.orange),
  psychology('Psychology',Colors.teal),
  inspiration('Inspiration',Colors.blue),
  comedy('Comedy',Colors.purple),
  action('Action & Adventure',Colors.lime),
  comics('Comics',Colors.lightBlue),
  children("Children's",Colors.indigoAccent),
  artAndPhotography('Art & Photography',Colors.deepOrange),
  foodAndDrink('Food & Drink',Colors.indigo),
  biography('Biography',Colors.cyan),
  scienceAndTech('Science & Technology',Colors.brown),
  guide('Guide / How-to',Colors.blueGrey),
  travel('Travel',Colors.red);

  final String genre;
  final Color color;
  const BookGenre(this.genre,this.color);
}
