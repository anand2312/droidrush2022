import 'package:edwards_pet/colors.dart';
import 'package:flutter/material.dart';
import 'package:edwards_pet/db_functions.dart';

class MoreDetailsPage extends StatelessWidget {
  const MoreDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: PetRushColors.oxfordBlue),
      child: const MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  final _phonecontroller = TextEditingController();
  final _streetnamecontroller = TextEditingController();
  final _citycontroller = TextEditingController();
  final _pincodecontroller = TextEditingController();
  final _statecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.only(top: 75, bottom: 60),
            child: Text(
              'Enter more details',
              style: TextStyle(
                  color: PetRushColors.babyPink,
                  fontSize: 40,
                  fontFamily: 'Rubik'),
            )),
        Expanded(
            child: Container(
                decoration: const BoxDecoration(
                    color: PetRushColors.charcoal,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25))),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 100, left: 25, right: 25),
                          child: TextFormField(
                            controller: _phonecontroller,
                            style: const TextStyle(
                                color: PetRushColors.papayaWhip,
                                fontSize: 20,
                                fontFamily: 'Rubik'),
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              isDense: true,
                              icon: Icon(
                                Icons.phone,
                                color: PetRushColors.papayaWhip,
                                size: 30,
                              ),
                              hintText: 'Enter a phone number',
                              hintStyle:
                                  TextStyle(color: PetRushColors.papayaWhip),
                              labelText: 'Phone',
                              labelStyle:
                                  TextStyle(color: PetRushColors.papayaWhip),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: PetRushColors.papayaWhip,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 25, right: 25),
                          child: TextFormField(
                            controller: _streetnamecontroller,
                            style: const TextStyle(
                                color: PetRushColors.papayaWhip,
                                fontSize: 20,
                                fontFamily: 'Rubik'),
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.location_on_sharp,
                                color: PetRushColors.papayaWhip,
                                size: 30,
                              ),
                              hintText: 'Enter your Street Name',
                              hintStyle:
                                  TextStyle(color: PetRushColors.papayaWhip),
                              labelText: 'Street Name',
                              labelStyle:
                                  TextStyle(color: PetRushColors.papayaWhip),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: PetRushColors.papayaWhip,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 25, right: 25),
                          child: TextFormField(
                            controller: _citycontroller,
                            style: const TextStyle(
                                color: PetRushColors.papayaWhip,
                                fontSize: 20,
                                fontFamily: 'Rubik'),
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.location_on_sharp,
                                color: PetRushColors.charcoal,
                                size: 30,
                              ),
                              hintText: 'Enter your City',
                              hintStyle:
                                  TextStyle(color: PetRushColors.papayaWhip),
                              labelText: 'City',
                              labelStyle:
                                  TextStyle(color: PetRushColors.papayaWhip),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: PetRushColors.papayaWhip,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 25, right: 25),
                          child: TextFormField(
                            controller: _pincodecontroller,
                            style: const TextStyle(
                                color: PetRushColors.papayaWhip,
                                fontSize: 20,
                                fontFamily: 'Rubik'),
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.location_on_sharp,
                                color: PetRushColors.charcoal,
                                size: 30,
                              ),
                              hintText: 'Enter your Pincode',
                              hintStyle:
                                  TextStyle(color: PetRushColors.papayaWhip),
                              labelText: 'Pincode',
                              labelStyle:
                                  TextStyle(color: PetRushColors.papayaWhip),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: PetRushColors.papayaWhip,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 25, right: 25),
                          child: TextFormField(
                            controller: _statecontroller,
                            style: const TextStyle(
                                color: PetRushColors.papayaWhip,
                                fontSize: 20,
                                fontFamily: 'Rubik'),
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.location_on_sharp,
                                color: PetRushColors.charcoal,
                                size: 30,
                              ),
                              hintText: 'Enter your State',
                              hintStyle:
                                  TextStyle(color: PetRushColors.papayaWhip),
                              labelText: 'State',
                              labelStyle:
                                  TextStyle(color: PetRushColors.papayaWhip),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: PetRushColors.papayaWhip,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.only(
                                top: 50, right: 10, left: 10),
                            child: Center(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          PetRushColors.salmonPink),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                                /*onPressed: addUserDetails(
                                  $_phonecontroller,
                                  $_streetnamecontroller,
                                  $_citycontroller,
                                  $_pincodecontroller,
                                  $_statecontroller,
                                ),*/
                                onPressed: () async {
                                  await addUserDetails(
                                      _phonecontroller.text,
                                      _streetnamecontroller.text,
                                      _citycontroller.text,
                                      _pincodecontroller.text,
                                      _statecontroller.text);
                                  if (!mounted) return;
                                  Navigator.pushNamed(context, '/home');
                                },
                                child: const Text(
                                  'SUBMIT',
                                  style: TextStyle(
                                    color: PetRushColors.oxfordBlue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                )))
      ],
    );
  }
}
