import 'package:edwards_pet/colors.dart';
import 'package:flutter/material.dart';

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
                  topRight: Radius.circular(25), topLeft: Radius.circular(25))),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 300, left: 25, right: 25),
                  child: TextFormField(
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
                      hintStyle: TextStyle(color: PetRushColors.papayaWhip),
                      labelText: 'Phone',
                      labelStyle: TextStyle(color: PetRushColors.papayaWhip),
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
                  padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
                  child: TextFormField(
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
                      hintText: 'Enter your address',
                      hintStyle: TextStyle(color: PetRushColors.papayaWhip),
                      labelText: 'Address',
                      labelStyle: TextStyle(color: PetRushColors.papayaWhip),
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
                    padding:
                        const EdgeInsets.only(top: 100, right: 150, left: 150),
                    child: const ElevatedButton(
                      onPressed: null,
                      child: Text('Submit'),
                    )),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
