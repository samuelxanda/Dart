import 'package:web/web.dart' as web;

// void main() {
//   final now = DateTime.now();
//   final element = web.document.querySelector('#output') as web.HTMLDivElement;
//   element.text =
//       'The time is ${now.hour}:${now.minute} '
//       'and your Dart web app is running!';
// }class Animal {
  String? name;
  String? species;
  
  Animal(this.name, this.species);

  void makeSound() {
    print("Generate animal sound");
  }
}

class Dog extends Animal {
  Dog(String name) : super(name, "Dog");
  
  @override
  void makeSound() {
    print("Dog $name Barks");
  }
}

class Cat extends Animal {
  Cat(String name) : super(name, "Cat");
  
  @override
  void makeSound() {
    print("Cat $name Meows");
  }
}

void main() {
  Dog dog = Dog("Buddy");
  dog.makeSound(); // Output: Dog Buddy Barks

  Cat cat = Cat("Whiskers");
  cat.makeSound(); // Output: Cat Whiskers Meows
}
