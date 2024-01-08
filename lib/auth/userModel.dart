class userModel{
  String? name;
  String? email;
  String? number;
  String? password;
  DateTime? createdTime;
  String? image;
  List? vehicles;

  userModel({
    required this.name,
    required this.email,
    required this.number,
    required this.password,
    required this.createdTime,
    required this.image,
    required this.vehicles,
  });

  factory userModel.fromJson(Map<String,dynamic> json)=>
      userModel(
        name: json['name'],
        email: json['email'],
        number: json['number'],
        password: json['password'],
        createdTime: json['createdTime'].toDate(),
        image: json['image'],
        vehicles: ['vehicles'],

      );

  Map<String,dynamic> toJson()=>{
    'name':name,
    'email':email,
    'number':number,
    'password':password,
    'createdTime':createdTime,
    'image':image,
    'vehicles':vehicles,
  };
}
