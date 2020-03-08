import 'package:blood_management/models/donor.dart';
import 'package:blood_management/models/donor_db.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:gender_selection/gender_selection.dart';
import 'package:intl/intl.dart';

class Donor extends StatefulWidget {
  @override
  _DonorState createState() => _DonorState();
}

class _DonorState extends State<Donor> {
  final format = DateFormat("yyyy-MM-dd");

  DateTime dob;
  bool c = false;

  String bg;
  bool yes = false;

  DateTime donated;

  bool no = false;

  Gender genders = Gender.Male;

   final _scaffoldKey = GlobalKey<ScaffoldState>();

  String name,address,email,ph;
  



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
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.orange,
        title: Text("Donor Details"),
        centerTitle: true,
      ),
      body: Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight, // 10% of the width, so there are ten blinds.
      colors: [Colors.orange, Colors.red], // whitish to gray
      tileMode: TileMode.repeated, // repeats the gradient over the canvas
    ),
  ),
  child: Theme(
    data: ThemeData(
      cursorColor: Colors.red,
      // indicatorColor: Colors.red,
      primaryColor: Colors.red
    ),
      child: ListView(
      children: <Widget>[
              GenderSelection(
                selectedGender: genders,
        // selectedGenderIconBackgroundColor: Colors.indigo, // default red 
        checkIconAlignment: Alignment.centerRight,   // default bottomRight
        selectedGenderCheckIcon: Icons.check, // default Icons.check
        onChanged: (Gender gender){
          setState(() {
            genders=gender;
          });
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
          onChanged: (value){
            name = value;
          },
          onSubmitted: (value){
            name = value;
          },
          decoration: InputDecoration(
            hintText: "Name",
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        SizedBox(
          height: 10.0
        ),


        TextField(
          onChanged: (value){
            ph=value;
          },
          onSubmitted: (value){
            ph=value;
          },
          keyboardType: TextInputType.number,
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
          onChanged: (value){
            email=value;
          },
          onSubmitted: (value){
            email=value;
          },
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
          onChanged: (value){
            address=value;
          },
          onSubmitted: (value){
            address=value;
          },
          decoration: InputDecoration(
            hintText: "Address",
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

        SizedBox(
          height: 10,
        ),

        Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListTile(
            isThreeLine: true,
            title: Text("When you donate before "),
            subtitle: DateTimeField(
                      
                      format: format,
                      onChanged: (value){
                        donated = value;
                        
                        // print(dob);
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
        SizedBox(
          height: 10,
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text("Send My Info ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        ),
        SizedBox(
          height: 10,
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20.0),

          child: Row(
            children: <Widget>[
              Text("To Everyone "),
          Checkbox(value: yes, 
          activeColor: Colors.orange,
          onChanged: (bool value){
            setState(() {
              yes = value;
              if(yes)
                no=false;
              
            });
          }),
              Text("Only To Hospitals  "),


          Checkbox(value: no, 
          activeColor: Colors.orange,
          onChanged: (bool value){
            setState(() {
              no = value;
              if(no)
                yes = false;

            });
          }),



            ],
          ),
        ),

        
        SizedBox(
          height: 20,
        ),

        Padding(
          padding: EdgeInsets.only(left: 120,right: 120),
          child: MaterialButton(
            elevation: 0.0,
            height: 40,
            minWidth: 10,
            onPressed: (){
              if(ph==null || name == null || email == null || dob == null || bg == null){
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(content: Text("Values Should not be empty "))
                );
              }
              else{
              DonorData data = DonorData(name, bg, DateTime.now().toString(), address, dob.toString(),ph,genders.toString());
              DBProvider db = new DBProvider();
              db.insertData(data);
              print("yea");
      _ackAlert(context);}
            },
          shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(20.0)
          ),
          color: Colors.orange,
          child: Text("Submit"),),
        ),

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
   iconEnabledColor: Colors.orange,
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



