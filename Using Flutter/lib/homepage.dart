import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:password_generator/input_field.dart';
import 'package:password_generator/themeservices.dart';
import 'package:random_password_generator/random_password_generator.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final password = RandomPasswordGenerator();
  final TextEditingController _lengthController = TextEditingController();
  bool _isWithLetters = true;
  bool _isWithUppercase = false;
  bool _isWithNumbers = false;
  bool _isWithSpecial = false;
  String newPassword = '';
  double _charpassword = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children : [
          SizedBox(height: 50),
          _welcomebar(),
          _passwordbar(),
          _resultbar(),
          ],
        ),
      ),
      
    );
  }
_appBar(){
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: (){

          ThemeService().switchTheme();
        },
        child: Icon(Get.isDarkMode?Icons.wb_sunny_outlined:Icons.nightlight_round,
        size: 20,
        color: Get.isDarkMode ?Colors.white:Colors.black,
      ),
      
      ),
      actions: [
        
      ],
    );
  }

_welcomebar(){
  return Container(
    margin: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Column(
            children: const [
              Text("Password Generator",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),)

            ],
          ),
        )
      ],
    ),
      
  );
}

_passwordbar(){
  return Container(
    margin: EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        InputField(title: "Password length", hint: "Enter length", controller: _lengthController),
        Row(
          children: [
            Text("Include Lowercase:"),
        Checkbox(value: this._isWithLetters, onChanged: (bool? value){
          setState(() {
            this._isWithLetters = value!;
          });
        })
          ], 
        ),
        Row(
          children: [
            Text("Include Uppercase: "),
        Checkbox(value: this._isWithUppercase, onChanged: (bool? value){
          setState(() {
            this._isWithUppercase = value!;
          });
        })
          ], 
        ),
        Row(
          children: [
            Text("Include Numbers: "),
        Checkbox(value: this._isWithNumbers, onChanged: (bool? value){
          setState(() {
            this._isWithNumbers = value!;
          });
        })
          ], 
        ),
        Row(
          children: [
            Text("Include Symbols:"),
        Checkbox(value: this._isWithSpecial, onChanged: (bool? value){
          setState(() {
            this._isWithSpecial = value!;
          });
        })
          ], 
        ),
        ElevatedButton(onPressed: (){
          setState(() {
            
          if (_lengthController.text.trim().isNotEmpty)
                    _charpassword =
                        double.parse(_lengthController.text.trim());


          newPassword = password.randomPassword(
                      letters: _isWithLetters,
                      numbers: _isWithNumbers,
                      passwordLength: _charpassword,
                      specialChar: _isWithSpecial,
                      uppercase: _isWithUppercase);
        
        });}
        , child: Container(
          child : const Text(
            "Generate Password",
            style: TextStyle(
            fontSize: 20,
            ),
          )
        ))
      ],
    ),
  );
}

_resultbar(){
  return Container(
    margin: EdgeInsets.all(0),
    height: 100,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
  
      children: [
        const Text(
          "Generated Password is:",
          style:TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          newPassword,
          style:const TextStyle(
            fontSize: 20,
            color: Colors.blueGrey,
          ),
        ),
        ElevatedButton(onPressed: (){
            Clipboard.setData(ClipboardData(text: newPassword));
            final snackBar = SnackBar(content:const Text("Password copied to clipboard"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }, child: Container(
          child: Text(
            "Copy to clipbaord"
          ),
          )
        )
      ],
    ),
  );
}
}
