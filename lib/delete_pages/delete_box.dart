import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DeleteBox extends StatefulWidget {
  const DeleteBox({super.key});

  @override
  State<DeleteBox> createState() => _DeleteBoxState();
}

class _DeleteBoxState extends State<DeleteBox> {
   static String? idDelete;

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      contentPadding: EdgeInsets.zero,
   
      content: Container(
      height: 190,
      width:210,
        decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
        color: Colors.white,
       ),

        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Confirm',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.black)),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Sure you want to delete the selected photo?',style: TextStyle(fontWeight: FontWeight.w400),),
              ),
            
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, child:  Text('CANCEL'),color: Colors.orangeAccent,textColor: Colors.white,padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),),
                         MaterialButton(onPressed: () {

                          showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('id to delete'),
            content: Text('Respected is'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
                         }, child:  Text('DELETE'),color: Colors.red,textColor: Colors.white,padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),),
                  ],
                ),
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}