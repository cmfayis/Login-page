import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class login extends StatefulWidget {
  login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/mainscreen.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              top: 60,
                            ),
                            child: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/user1.png'),
                              radius: 50.0,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(
                              30.0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(
                                  30.0,
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 60,
                                    ),
                                    TextfieldValidation(
                                      labelText: 'FIRSTNAME',
                                      hintText: 'FIRSTNAME',
                                      yes: false,
                                      isEmpty: 'First name is required',
                                      type:
                                          'Fistname must contain 3 to 15 characters',
                                      reg:
                                          'Fisrt name can only contain letters',
                                      regExp: RegExp(r'^[a-zA-Z_]+$'),
                                      num: 15,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextfieldValidation(
                                      labelText: 'LASTNAME',
                                      hintText: 'LASTNAME',
                                      yes: false,
                                      isEmpty: 'Last name is required',
                                      type:
                                          'Lastname must contain 3 to 15 characters',
                                      regExp: RegExp(r'^[a-zA-Z_]+$'),
                                      num: 15,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      maxLength: 21,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                        labelText: 'Email ',
                                        hintText: 'Email',
                                        labelStyle:
                                            TextStyle(color: Colors.white38),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 190, 159, 159),
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'email is required';
                                        } else if (!RegExp(
                                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                            .hasMatch(value)) {
                                          return 'Enter Correct Email Id';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    TextFormField(
                                      maxLength: 2,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'^[0-9]+$')),
                                      ],
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                        labelText: 'Age',
                                        hintText: 'Age',
                                        labelStyle:
                                            TextStyle(color: Colors.white38),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 190, 159, 159),
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Age is required';
                                        } else if (int.parse(value) < 18) {
                                          return 'Age must be 18';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextfieldValidation(
                                      labelText: 'PHONE',
                                      hintText: 'PHONE',
                                      yes: false,
                                      isEmpty: 'Phone number is required',
                                      ph: 'Phone number must have exactly 10 digits',
                                      regExp: RegExp(r'[0-9]'),
                                      num: 10,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextfieldValidation(
                                      labelText: 'PASSWORD',
                                      hintText: 'PASSWORD',
                                      yes: true,
                                      isEmpty: 'Password is required',
                                      regExp: RegExp(r'^[a-zA-Z0-9_]+$'),
                                      num: 10,
                                      type:
                                          'Password must contain 3 to 10 characters or numbers',
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 40,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title:
                                                      Text('Validation Submit'),
                                                  content: Text('Thank You...'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        setState(() {
                                                          _formKey.currentState!
                                                              .reset();
                                                        });
                                                      },
                                                      child: Text('OK'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        },
                                        child: Text(
                                          'Submit',
                                          style:
                                              TextStyle(fontFamily: 'Pacifico'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
