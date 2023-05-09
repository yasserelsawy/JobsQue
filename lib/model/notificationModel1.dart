

class NotificationModel {

  String name ;


  NotificationModel({required this.name}) ;

  static List<NotificationModel> data = [
    NotificationModel(

      name: "Your Job Search Alert",

    ),
    NotificationModel(

      name: "Job Application Update",

    ),
    NotificationModel(

      name: "Job Application Reminders",

    ),
    NotificationModel(

      name: "Job Seeker Updates",

    ),

  ];

}

