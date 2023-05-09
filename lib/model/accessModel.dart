

class AccessModel {

  String name ;


  AccessModel({required this.name}) ;

  static List<AccessModel> data = [
    AccessModel(

      name: "Email address",

    ),
    AccessModel(

      name: "Phone number",

    ),
    AccessModel(

      name: "Change password",

    ),
    AccessModel(

      name: "Two-step verification",

    ),
    AccessModel(

      name: "Face ID",

    ),

  ];

}

