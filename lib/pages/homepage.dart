import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:photo_app_flutter/delete_pages/delete_api.dart';
import 'package:photo_app_flutter/delete_pages/delete_box.dart';
import 'package:photo_app_flutter/pages/formpage.dart';
import 'package:photo_app_flutter/retrieve_data_pages/retrieve_api.dart';
import 'package:photo_app_flutter/retrieve_data_pages/retrieve_class.dart';
import 'package:intl/intl.dart';
import 'package:photo_app_flutter/update_pages/update_api.dart';

class HomePagePhoto extends StatefulWidget {
  const HomePagePhoto({super.key});

  @override
  State<HomePagePhoto> createState() => _HomePagePhotoState();
}

class _HomePagePhotoState extends State<HomePagePhoto> {



  List<RetriveDataclass> ? retrievedata;
  var isLoaded=false;

  @override
  void initState() {
    super.initState();
    getData();
    
    
  }

  getData() async {
    retrievedata= await RetrieveApi().retrieveUser();
    if(retrievedata !=null) {
      setState(() {

        isLoaded=true;
      });


      
    }
  }
  
  @override
  Widget build(BuildContext context) { 
    Color myOrangeColor=Color(0xFFF68F50);
    Color myGreyColor=Color(0xFF4A4C50);

    

    return Scaffold( 
       appBar: AppBar(
        backgroundColor: myGreyColor,
        title: Text('Photo Gallery',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white70,),),
        
        actions: [
          IconButton( icon: Icon(Icons.filter_list,color: Colors.white70,),onPressed: (){},),
          IconButton(icon: Icon(Icons.sort_rounded,color: Colors.white70,),onPressed: () {},),
        ],
        
       ) ,
      body:  Visibility(
        visible: isLoaded,
        
      child: GridView.builder(
        
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:  MediaQuery.of(context).size.width < 600 ? 2 : MediaQuery.of(context).size.width < 800 ? 3 : 5,
          crossAxisSpacing: 1, 
          mainAxisSpacing: 2,
        ),

           
          itemCount: retrievedata?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [

                  Container(
                    height: 200,
                    width: 200,
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                   image: DecorationImage(
                        image: NetworkImage(retrievedata![index].imageUrl),
                         fit: BoxFit.cover,

                         
                         ),
                   ),
                  
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        
                       children: [
                        
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            
                            children: [
                            IconButton(
                                onPressed: () async {
                                bool likedState = retrievedata![index].isLiked;
                              setState(() {
                              retrievedata![index].isLiked = !likedState;
                               });
                             await UpdateApi().updateIsLiked(retrievedata![index].id, !likedState);
                                 },
                             icon: Icon(
                           Icons.favorite,
                           color: retrievedata![index].isLiked ? Colors.red : myOrangeColor,
                          ),
                          ),


                           
                             IconButton(
                            onPressed: () {
                               showDialog(
                               context: context,
                        builder: (BuildContext context) {
                                 return AlertDialog(
                                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                                  
                               title: Center(child: Text('Confirm',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),),

                                content:Container(
                                 
                                height: 110,
                                width:160,
                                decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5.0),
                                ),
                                 
                                
                                     child:Column(
                                      
                                children: [
                                 Text('Sure you want to delete the selected photo?',style: TextStyle(fontWeight: FontWeight.bold),),
                       Padding(
                         padding: const EdgeInsets.all(16.0),
                    
                       ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      
                      children: [
                        MaterialButton(onPressed: (){
                               Navigator.of(context).pop();
                             },
                             color: myOrangeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                             child: Text('CANCEL',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),),),
                    
                              MaterialButton(onPressed: () async{
                               
                                  
                     await  DeleteApi().deleteUser(retrievedata![index].id);
                     showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                    
                                content: Text('Deleted Sucessfullly'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) => HomePagePhoto(),
                            ),
                          );
                                      
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );                   
                          
                    
                            },color: Colors.red,
                           
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),child: Text('DELETE',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),),),
                      ],
                    ),
                           
              ],
            ),
          ),
          
        );
      },
    );
  },
  icon: Icon(Icons.delete),
  color: Colors.red,
),



                             
                               
                            ],
                          ),
                        ),
                       
                       ],
                      )),


                    
                    Container(
                      color: Colors.black.withOpacity(0.7),
                      child: Expanded(
                        
                        child: Padding(
                          
                        padding: const EdgeInsets.all(8.0),
                      
                        child: Column(
                          
                          mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                             
                            
                            
                            children: [
                             
                           Text(
                               retrievedata![index].description,
                                    maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                         style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                                           ),    
                                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(retrievedata![index].createdDate.substring(8,10)+' '+retrievedata![index].createdDate.substring(4,7)+','+retrievedata![index].createdDate.substring(11,15),style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),),
                              Row(
                                children: [
                                  Text(" ~by ",style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),),
                                  Text(retrievedata![index].name,style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ],
                          ),  
                            ],
                        ),
                      )),
                    ),
                  ],
                ),
                    
                  ),
                ],
              ),
                        );
                        
          },
         
        ),
        replacement: const Center(
            child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (context) {
          return FormPage();
        });
      },
      backgroundColor: myOrangeColor,
      child:Icon(Icons.add, color: Colors.white70,),
      shape: CircleBorder(),

      ),
      
    );
  }
}