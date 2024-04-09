class RetrieveClass {
   String email;
   String firstName;
   String lastName;
   String avatar;

   RetrieveClass( {
   required this.email,
   required this.firstName,
   required this.lastName,
   required this.avatar,
   });

   RetrieveClass.fromJson(Map<String,dynamic>json) 
    : email=json["email"],
    firstName=json["first_name"],
    lastName=json["last_name"],
    avatar =json["avatar"];
    
   }

  