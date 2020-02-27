import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:gender_selection/gender_selection.dart';
import 'package:intl/intl.dart';

class Hospital extends StatefulWidget {
  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  final format = DateFormat("yyyy-MM-dd");

  DateTime dob;
  bool c = false;

  String bg;

  DateTime donated;


  _ackAlert(BuildContext context) {
    showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Submit Sucessfully'),
        // content: const Text('Thankyou for your help...'),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
        title: Text("Hospital Details"),
        centerTitle: true,
      ),
      body: Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight, // 10% of the width, so there are ten blinds.
      colors: [Colors.green, Colors.greenAccent], // whitish to gray
      tileMode: TileMode.repeated, // repeats the gradient over the canvas
    ),
  ),
  child: Theme(
    data: ThemeData(
      cursorColor: Colors.green,
      // indicatorColor: Colors.green,
      primaryColor: Colors.green
    ),
      child: ListView(
      children: <Widget>[
              GenderSelection(
                selectedGenderIconColor: Colors.green,
        selectedGenderIconBackgroundColor: Colors.white, // default green 
        checkIconAlignment: Alignment.centerRight,   // default bottomRight
        selectedGenderCheckIcon: Icons.check, // default Icons.check
        onChanged: (Gender gender){
        print(gender);
        },
        equallyAligned: true,
        animationDuration: Duration(milliseconds: 400),
        isCircular: true, // default : true,
        isSelectedGenderIconCircular: true,
        opacityOfGradient: 0.4,
        padding: const EdgeInsets.all(3),
        size: 60, //default : 120
        ),
        SizedBox(
          height: 10.0
        ),
        
        TextField(
          decoration: InputDecoration(
            hintText: "Patient Name",
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        SizedBox(
          height: 10.0
        ),


        TextField(
          decoration: InputDecoration(
            hintText: "Mobile Number",
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        SizedBox(
          height: 10.0
        ),

        TextField(
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        SizedBox(
          height: 10.0
        ),

        TextField(
          decoration: InputDecoration(
            hintText: "Address",
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        SizedBox(
          height: 10.0
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Patient Doctor Name",
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),

        Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListTile(
            isThreeLine: true,
            title: Text("Date Of Birth"),
            subtitle: DateTimeField(
                      
                      format: format,
                      onChanged: (value){
                        dob = value;
                        setState(() {c=true;
                          
                        });
                        print(dob);
                      },
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                      },
                    ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListTile(
            isThreeLine: true,
            title: Text("Age",),
            subtitle: c?Text("${calculateAge(dob)} Years",):Text(""),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListTile(
            isThreeLine: true,
            title: Text("Blood Group",),
            subtitle: _bg()
        ),
        ),

        // SizedBox(
        //   height: 10,
        // ),

        // Padding(
        //   padding: const EdgeInsets.all(2.0),
        //   child: ListTile(
        //     isThreeLine: true,
        //     title: Text("When you donate before "),
        //     subtitle: DateTimeField(
                      
        //               format: format,
        //               onChanged: (value){
        //                 donated = value;
                        
        //                 // print(dob);
        //               },
        //               onShowPicker: (context, currentValue) {
        //                 return showDatePicker(
        //                     context: context,
        //                     firstDate: DateTime(1900),
        //                     initialDate: currentValue ?? DateTime.now(),
        //                     lastDate: DateTime(2100));
        //               },
        //             ),
        //   ),
        // ),
        // SizedBox(
        //   height: 10,
        // ),

        RaisedButton(
          onPressed: (){
      _ackAlert(context);
          },
          elevation: 0.0,
        color: Colors.transparent,
        child: Text("Submit"),),

        SizedBox(
          height: 20,
        ),
      ],
    ),
  ),
),
    );



  }

  DropdownButton _bg() => DropdownButton<String>( 
   iconEnabledColor: Colors.green,
        items: [
          DropdownMenuItem(
            value: "A+",
            child: Text(
              "A+",
            ),
          ),
          DropdownMenuItem(
            value: "A-",
            child: Text(
              "A-",
            ),
          ),

          DropdownMenuItem(
            value: "B+",
            child: Text(
              "B+",
            ),
          ),
          DropdownMenuItem(
            value: "B-",
            child: Text(
              "B-",
            ),
          ),

          DropdownMenuItem(
            value: "O+",
            child: Text(
              "O+",
            ),
          ),
          DropdownMenuItem(
            value: "O-",
            child: Text(
              "O-",
            ),
          ),
          DropdownMenuItem(
            value: "AB+",
            child: Text(
              "AB+",
            ),
          ),
          DropdownMenuItem(

            value: "AB-",
            child: Text(
              "AB-",
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            bg = value;
          });
        },
        
        value: bg,
        hint: Text("Select"),
      );


}


calculateAge(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  int month1 = currentDate.month;
  int month2 = birthDate.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = birthDate.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}



