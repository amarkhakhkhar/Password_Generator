import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  const InputField({ Key? key, required this.title, required this.hint, this.controller }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,

            ),
          ),
          // Container(
          //   height: 50,
          //   margin: EdgeInsets.all(8),

          // ),
          Row(
            
            children: [
              Expanded(child: 
              TextFormField(
                keyboardType: TextInputType.number,
                readOnly: false,
                controller: controller,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: hint
                ),
              )
              )
            ],
          )
        ],
      ),
    );
  }
}