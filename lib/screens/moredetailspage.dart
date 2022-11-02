

import 'package:edwards_pet/colors.dart';
import 'package:flutter/material.dart';

class moreDetailsPage extends StatefulWidget {
  const moreDetailsPage({Key? key}) : super(key: key);

  @override
  State<moreDetailsPage> createState() => _moreDetailsPageState();
}

class _moreDetailsPageState extends State<moreDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Enter more details';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        backgroundColor: PetRushColors.oxfordBlue,
        /*appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
          centerTitle: true,
          backgroundColor: PetRushColors.oxfordBlue,
          title: Text(appTitle),
        ),
      ),*/
        body: MyCustomForm(),
      ),
    );
  }
  }

class MyCustomForm extends StatefulWidget{
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
    return Container(
      color: PetRushColors.charcoal,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:300,left:25,right:25),
              child: TextFormField(
                style: TextStyle(color: PetRushColors.babyPink,fontSize: 20,fontFamily:'Rubik'),
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  isDense: true,
                  icon: const Icon(Icons.phone,color: PetRushColors.babyPink,size: 30,),
                  hintText: 'Enter a phone number',
                  hintStyle: TextStyle(color: PetRushColors.babyPink),
                  labelText: 'Phone',
                  labelStyle: TextStyle(color: PetRushColors.babyPink),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: PetRushColors.babyPink,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:25,left:25,right:25),
              child: TextFormField(
                style: TextStyle(color: PetRushColors.babyPink,fontSize: 20,fontFamily: 'Rubik'),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.location_on_sharp,color: PetRushColors.babyPink,size: 30,),
                  hintText: 'Enter your address',
                  hintStyle: TextStyle(color: PetRushColors.babyPink),
                  labelText: 'Address',
                  labelStyle: TextStyle(color: PetRushColors.babyPink),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: PetRushColors.babyPink,
                    ),
                  ),
                ),
              ),
            ),
            new Container(
                padding: const EdgeInsets.only(top: 100, right:150, left:150),
                child: new ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: null,
                )),
          ],
        ),
      ),
    );

  }
}