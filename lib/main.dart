import 'package:flutter/material.dart';

import 'screens/donor.dart';

void main() => runApp(
  MaterialApp(
    title: "Life",
    home: MyApp(),
  )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int c;
  @override
  void initState() {
    super.initState();
    c=0;
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          title: Text("Life"),
          centerTitle: true,
          backgroundColor: Colors.red,),
        body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: height/1.6,
                        width: width/2, 
                        child: Center(
                          child: Image.asset("images/logo.png"),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            c=1;
                          });
                        },
                                    child: Padding(
                          padding: const EdgeInsets.only(right: 10.0,left: 10.0),
                          child: Container(
                            width: width,
                            height: 40.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3.0
                              ),
                              color: c==1?Colors.red:Colors.white,

                              borderRadius: BorderRadius.circular(20)
                              
                            ),
                            child: Center(child: Text("Donor",style: TextStyle(color: c==1?Colors.white:Colors.red,fontWeight: FontWeight.bold,fontSize: 15))),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10.0
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            c=2;
                          });
                        },
                                    child: Padding(
                          padding: const EdgeInsets.only(right: 10.0,left: 10.0),
                          child: Container(
                            width: width,
                            height: 40.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3.0
                              ),
                              color: c==2?Colors.red:Colors.white,
                              borderRadius: BorderRadius.circular(20)
                              
                            ),
                            child: Center(child: Text("Hospital",style: TextStyle(color: c==2?Colors.white:Colors.red,fontWeight: FontWeight.bold,fontSize: 15))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0
                      ),

                      c!=0?Container(
                            width: width/4,
                            height: 40.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3.0
                              ),
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)
                              
                            ),
                            child: InkWell(
                              onTap: (){
                                if(c==1)
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Donor()));
                              },
                              child: Center(child: Text("Next ->",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15)))),
                          ):Container(),
                      
                    ],
                  ),
        ),
      ),
    );
  }
}