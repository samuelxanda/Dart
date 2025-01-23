// class Animal {
//   String? name;
//   String? species;
//   Animal(this.name, this.species);
//   void makeSound() {
//     print("Generate animal sound");
//   }
// }

// class Dog extends Animal {
//   Dog(String, name) : super(name, "Keke");
//   void makeSound() {
//     print("Dogs $name Barks");
//   }
// }

// class Cat extends Animal {
//   Cat(String, name) : super(name, "Close");
//   void makeSound() {
//     print("Cat $name Meows");
//   }
// }

// void main() {
//   Dog x = Dog("dddd", "yyy");
//   x.makeSound();

//   Cat y = Cat("sdsds", "sdsds");
//   y.makeSound();
// }

class User {
  String? names;
  int? id;
  String? address;

  // User(this.names, this.id, this.address);

  void userInfo() {
    print("NAMES : $names");
    print("ID : $id");
    print("ADDRESS : $address");
  }
}

void main() {
  User x = User();
  x.names = "Samuel Xanda";
  x.id = 165656;
  x.address = "Kigali";
  x.userInfo();
}
