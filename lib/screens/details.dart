import 'package:blood_management/models/donor.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final DonorData data;
  final bool c;
  const Details({Key key, this.data, this.c}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var widht = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: c==true?Text("Donor's Records"):Text("Hospital's Records"),backgroundColor: c==true?Colors.orange:Colors.green,
      centerTitle: true,),
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: height/12,
              left: widht/15,
              right: widht/15,
              bottom: height/12,
              
                          child: Card(
                elevation: 50.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)
                ),
                color: c==true?Colors.orange:Colors.green,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    SizedBox(height: 10,),
                    card("   Name", data.name),
                    SizedBox(height: 50,),
                    card("   Blood Group", data.bg),
                    SizedBox(height: 50,),
                    card("   Address", data.address),
                    SizedBox(height: 50,),
                    card("   Birth Date", data.dob),
                    SizedBox(height: 50,),
                    card("   Donation Time", data.email),
                    SizedBox(height: 50,),
                    card("   Gender", data.gender),
                  ],
                ),
              ),
            ),
            Positioned(
              top: height/25,
              left: MediaQuery.of(context).size.width/2.5,
                          child: CircleAvatar(
                            backgroundColor: c==true?Colors.orange:Colors.green,
                    radius: 40,
                    child: Icon(Icons.account_circle,size: 80,color: Colors.white,),
                  ),
            ),
          ],
        )
      ),
    );
  }
}

Widget card(String key,String value){
  if(key == "   Birth Date" || key == "   Donation Time"){
    String v = "";
    for(int i=0;i<10;++i){
      v=v+value[i];

    }
    value = v;
  }
  if(key == "   Gender"){
    String v = "";
    for(int i=7;i<value.length;++i){
      v=v+value[i];

    }
    value = v;
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Container(
        child: Text(key + "  :    ",style: TextStyle(fontSize: 20.0,)),
      ),
      Container(
        child: Text(value,style: TextStyle(fontSize: 20.0,)),
      ),
    ],
  );

}