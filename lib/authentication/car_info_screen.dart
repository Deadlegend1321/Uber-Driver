import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uber_driver/global/global.dart';
import 'package:uber_driver/splashScreen/splash_screen.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({Key? key}) : super(key: key);

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController = TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();
  List carTypeslist = ["uber-x", "uber-go", "bike"];
  String? selectedCarType;

  saveCarInfo(){
    Map driverCarInfoMap = {
      "car_colour": carColorTextEditingController.text.trim(),
      "car_number": carNumberTextEditingController.text.trim(),
      "car_model": carModelTextEditingController.text.trim(),
      "type": selectedCarType
    };

    DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers");
    driversRef.child(currentFirebaseUser!.uid).child("car_details").set(driverCarInfoMap);
    Fluttertoast.showToast(msg: "Car Details has been saved");
    Navigator.push(context, MaterialPageRoute(builder: (c)=> SplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("images/driver_logo.png"),
              ),
              const SizedBox(height: 10,),
              const Text(
                "Car Details",
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                ),
              ),
              TextField(
                controller: carModelTextEditingController,
                keyboardType: TextInputType.name,
                style: const TextStyle(
                    color: Colors.grey
                ),
                decoration: const InputDecoration(
                    labelText: "Car Model",
                    hintText: "Name",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    ),
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10
                    ),
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14
                    )
                ),
              ),
              TextField(
                controller: carNumberTextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    color: Colors.grey
                ),
                decoration: const InputDecoration(
                    labelText: "Car Number",
                    hintText: "XY12 1234 1234",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    ),
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10
                    ),
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14
                    )
                ),
              ),
              TextField(
                controller: carColorTextEditingController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                    color: Colors.grey
                ),
                decoration: const InputDecoration(
                    labelText: "Car Color",
                    hintText: "White",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    ),
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10
                    ),
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14
                    )
                ),
              ),
              const SizedBox(height: 20,),
              DropdownButton(
                dropdownColor: Colors.black,
                value: selectedCarType,
                  items: carTypeslist.map((car) {
                    return DropdownMenuItem<String>(
                      value: car,
                        child: Text(
                            car,
                          style: const TextStyle(
                            color: Colors.grey
                          ),
                        )
                    );
                  }).toList(),
                hint: const Text(
                    "Please choose a car type",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey
                  ),
                ),
                onChanged: (value){
                    setState(() {
                      selectedCarType = value.toString();
                    });
                },
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    if(carColorTextEditingController.text.isNotEmpty &&
                    carModelTextEditingController.text.isNotEmpty &&
                    carNumberTextEditingController.text.isNotEmpty &&
                    selectedCarType != null){
                      saveCarInfo();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white54
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
