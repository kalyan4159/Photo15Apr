class PhotoInputClass {
  
   String name;
   String description;
   String imageURL;
   

   PhotoInputClass( {
   required this.name,
   required this.description,
   required this.imageURL,
  
   });

   Map<String,dynamic>toJson() {
   return { 
    'name':name,
    'description':description,
    'imageURL':imageURL,
   
   };
}
}