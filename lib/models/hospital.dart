class HospitalData{
  String name;
  String bg;
  String email;
  String address;
  String dob;
  String no;
  String gender;

  HospitalData(this.name, this.bg, this.email, this.address, this.dob, this.no,this.gender);

  Map<String,dynamic> toMap(){
    Map map = Map<String,dynamic>();
    map['name'] = name;
    map['bg'] =bg;
    map['email'] = email;
    map['dob'] = dob;
    map['address'] = address;
    map['no'] = no;
    map['gender'] = gender;
  
  return map;
  }

  HospitalData.fromMap(Map<String,dynamic> map){
    this.name = map['name'];
    this.bg = map['bg'];
    this.email = map['email'];
    this.address = map['address'];
    this.dob = map['dob'];
    this.no = map['no'];
    this.gender = map['gender'];
  }

}