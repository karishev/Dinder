import 'dart:ffi';

const List explore_json = [
  {
    "img": "lib/images/girls/img_1.jpeg",
    "name": "Ayo",
    "age": "20",
    "likes": ["Dancing", "Cooking", "Art"],
  },
  {
    "img": "lib/images/girls/img_2.jpeg",
    "name": "Rondeau",
    "age": "18",
    "likes": ["Instagram", "Cooking"],
  },
  {
    "img": "lib/images/girls/img_3.jpeg",
    "name": "Valerie",
    "age": "22",
    "likes": ["Instagram", "Netflix", "Comedy"],
  },
  {
    "img": "lib/images/girls/img_4.jpeg",
    "name": "Mary",
    "age": "22",
    "likes": ["Travel", "Fashion", "Reading"],
  },
  {
    "img": "lib/images/girls/img_5.jpeg",
    "name": "Angie",
    "age": "18",
    "likes": ["Model", "Fashion", "Working Out"],
  },
  {
    "img": "lib/images/girls/img_6.jpeg",
    "name": "Anne",
    "age": "19",
    "likes": ["Shopping", "Travel", "Cat lover"],
  },
  {
    "img": "lib/images/girls/img_7.jpeg",
    "name": "Fineas",
    "age": "20",
    "likes": ["Model", "Nature", "Instagram"],
  },
  {
    "img": "lib/images/girls/img_8.jpeg",
    "name": "Atikh",
    "age": "18",
    "likes": ["Cooking", "Art", "Working Out"],
  },
  {
    "img": "lib/images/girls/img_9.jpeg",
    "name": "Campbell",
    "age": "18",
    "likes": ["Swimming", "Working Out"],
  },
  {
    "img": "lib/images/girls/img_10.jpeg",
    "name": "Maya",
    "age": "19",
    "likes": ["Swag", "Dancing"],
  },
];

enum Major { computerScience, math, business, interactiveMedia, music }

class Person {
  final int id;
  final String name;
  final String surname;
  List<Person> likedPeople = [];
  int age;
  Major major;
  String imageUrl;

  Person(
      {this.id,
      this.name,
      this.surname,
      this.age,
      this.major,
      this.imageUrl,
      this.likedPeople});

  String getMajor() {
    switch (major) {
      case Major.computerScience:
        return 'Computer Science';
      case Major.math:
        return 'Mathematics';
      case Major.business:
        return 'Business';
      case Major.interactiveMedia:
        return 'Interactive Media';
      case Major.music:
        return 'Music';
      default:
        return 'Undeclared';
    }
  }

  String getAge() {
    return age.toString();
  }
}
