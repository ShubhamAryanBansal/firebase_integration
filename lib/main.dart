import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/authentication/presentation/screens/signup_screen.dart';

Future main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const ProviderScope(
      child: MyApp(),
    ));
  });

  PizzaService.main();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const SignUpScreen(),
    );
  }
}

enum VehicleType {CAR, BIKE}

abstract class Vehicle{
  void drive();
}

class CarVehicle implements Vehicle{

  @override
  void drive(){
    print('Car_Driving');
  }
}

class BikeVehicle implements Vehicle {

  @override
  void drive(){
    print("Bike_Driving");
  }
}

class VehicleFactory{

  static Vehicle createVehicle (VehicleType vehicleType){
    if(vehicleType == VehicleType.CAR){
      return CarVehicle();
  }else{
      return BikeVehicle();
    }
    }
}

class Main{

  mainMethod(){
    Vehicle _vehicle = VehicleFactory.createVehicle(VehicleType.BIKE);
    _vehicle.drive();
  }
}

//Incase of Abstract Factory Pattern This is the additional part

abstract class AbstractVehicleFactory{
  Vehicle createVehicle();
}

class CarFactory implements AbstractVehicleFactory{

  @override
  Vehicle createVehicle(){
    return CarVehicle();
  }

}

class BikeFactory implements AbstractVehicleFactory{

  @override
  Vehicle createVehicle(){
    return BikeVehicle();
  }

}

class InitMain{

  static main(){
    AbstractVehicleFactory vehicleFactory = CarFactory();
    final car = vehicleFactory.createVehicle();
    car.drive();

    vehicleFactory = BikeFactory();
    final bike = vehicleFactory.createVehicle();
    bike.drive();
  }
}

//Strategy Design Pattern

abstract class StrategyPattern{
  int doOperation(int num1,int num2);
}

class AdditionStrategy implements StrategyPattern{

  @override
  int doOperation(int num1,int num2){
    return num1 + num2;
  }
}

class MultiplicationStrategy implements StrategyPattern{

  @override
  int doOperation(int num1,int num2){
    return num1 * num2;
  }

}

class Controller {

  StrategyPattern strategyPattern;

  Controller(this.strategyPattern);

  int doOperation(int num1, int num2){
    return strategyPattern.doOperation(num1, num2);
  }
}

class UserInteraction{

  static main(){

    Controller _impl = Controller(AdditionStrategy());
    print('Result ${_impl.doOperation(2, 4)}');
    _impl.strategyPattern = MultiplicationStrategy();
    print('Result ${_impl.doOperation(2, 4)}');

  }
}


//Decorator Design Pattern

abstract class Pizza{
  String getDescription();
  double getCost();
}

class CheesePizza implements Pizza{
  @override
  String getDescription() => 'Cheese Pizza';

  @override
  double getCost() => 8.0;
}

class FarmhousePizza implements Pizza{
  @override
  String getDescription() => 'FarmhousePizza Pizza';

  @override
  double getCost() => 12.0;

}

abstract class PizzaDecorator implements Pizza{

  Pizza pizza;

  PizzaDecorator(this.pizza);

  @override
  String getDescription() => pizza.getDescription();

  @override
  double getCost() => pizza.getCost();

}

class PepperoniTopping extends PizzaDecorator {

  PepperoniTopping(Pizza pizza) : super(pizza);

  @override
  String getDescription() => '${pizza.getDescription()}, With Pepperoni Toppings';

  @override
  double getCost() => pizza.getCost() + 4;

}

class VegetableToppings extends PizzaDecorator {

  VegetableToppings(Pizza pizza) : super(pizza);

  @override
  String getDescription() => '${pizza.getDescription()}, With VegetableToppings';

  @override
  double getCost() => pizza.getCost() + 6;

}

class PizzaService{

  static main(){

    Pizza pizza = FarmhousePizza();
    pizza = VegetableToppings(pizza);
    pizza = PepperoniTopping(pizza);

    print('Price ${pizza.getCost()} | Description ${pizza.getDescription()}');
  }

}

