import 'package:blood_management/models/donor.dart';
import 'package:blood_management/models/donor_db.dart';
import 'package:blood_management/models/hospital_db.dart';
import 'package:blood_management/screens/details.dart';
import 'package:flutter/material.dart';


class Data extends StatefulWidget {
  final bool c;

  const Data({Key key, this.c}) : super(key: key);
  @override
  _DataState createState() => _DataState(c);
}

class _DataState extends State<Data> {

  List<Map<String,dynamic>> donorList;
  DBProvider db;
  DBHProvider dbh;
  DonorData data;
  final bool c;

  _DataState(this.c);
  
  
  @override
  void initState() {
    c==true?db=new DBProvider():dbh=new DBHProvider();
    
    takeList();
        super.initState();
      }
    
      @override
      Widget build(BuildContext context) {
        if (donorList==null)
          checkList();
          return Scaffold(
      appBar: AppBar(title: c==true?Text("Donor's Records"):Text("Hospital's Records"),backgroundColor: c==true?Colors.orange:Colors.green,
      centerTitle: true,),
            
            body: ListView.builder(
              itemCount: donorList==null?0:donorList.length,
              itemBuilder: (context,index){
                if(donorList.length!=0){
                  data=DonorData.fromMap(donorList[index]);
                  return Padding(
                    padding: EdgeInsets.all(15),
                    child: ListTile(
                      title: Text("${data.name}"),
                      subtitle: Text("${data.no}"),
                      leading: Icon(Icons.label_important,color: c==true?Colors.orange:Colors.green,),
                      onTap: (){
                  data=DonorData.fromMap(donorList[index]);

                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Details(data: this.data,c: this.c,)));
                      },
                    ),
                    );
                }else{
                  return Center(
                    child: InkWell(
                      child: Text("Refresh"),
                      onTap: (){
                        setState(() {});
                      },
                      )
                  );
                }
              },
            ),
          );
      }

      takeList() async{
        donorList = c==true?await db.displayData():await dbh.displayData();
      }

    checkList() async{
      Future.delayed(Duration(milliseconds: 200),(){
        print("yeah;");
          setState(() {});

      });
    }

    }

    