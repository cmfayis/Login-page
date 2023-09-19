import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldValidation extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool yes;
  final String isEmpty;
  final String? type;
  final String? reg;
  final String? ph;
  final RegExp regExp;
  final int num;
  

  TextfieldValidation({
    required this.labelText,
    required this.hintText,
    required this.yes,
    required this.isEmpty,
    this.type,
    this.reg,
    this.ph,
    required this.regExp,
    required this.num, 
    
    
  });
  @override
  State<TextfieldValidation> createState() => _TextfieldValidationState();
}

class _TextfieldValidationState extends State<TextfieldValidation> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: widget.yes,
        inputFormatters: [
          FilteringTextInputFormatter.allow(widget.regExp),
        ],
        maxLength: widget.num,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Color.fromARGB(95, 239, 208, 208)),
          labelText: widget.labelText,
          hintStyle: TextStyle(color: Colors.grey),
          hintText: widget.hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 190, 159, 159),
            ),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return widget.isEmpty;
            
          }
           else if (value.length < 3 || value.length > 15) {
            return widget.type;
          } else if (value.length < 10) {
            return widget.ph;
          }
          
     
          return null;
        }
        );
  }
}
