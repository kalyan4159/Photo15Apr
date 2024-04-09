import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_app_flutter/insert_data_pages/photo_input_api.dart';
import 'package:photo_app_flutter/insert_data_pages/photoinputclass.dart';
import 'package:photo_app_flutter/pages/homepage.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController imageURLController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    imageURLController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color myOrangeColor = Color(0xFFF68F50);
    double textWidthSize = 150;
    double boxWidth=300;

    return SingleChildScrollView(
      
      child: AlertDialog(
       shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.grey, width: 2.0),
                  ),
        title: Center(

          child: Text(
            'Add Photo',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        content: Form(
         
          key: _formkey,
          child: SizedBox(
            width: boxWidth,
           
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    
                        top: 20,
                     
                      
                     ),
                  child: Row(
                    children: [
                      SizedBox(width: textWidthSize, child: const Text('Photographer\'s Name',style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(
                        child: TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Something';
                            } else if (RegExp(r'[0-9]').hasMatch(value)) {
                              return 'Numbers are not allowed';
                            }
                            return null;
                          },
                          decoration:  InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 20.0),

                            hintText: 'Enter text',
                            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                            border: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                            ),
                            isDense: true,
                          ),
                          minLines: 1,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                   padding: const EdgeInsets.only(
                    
                        top: 20,
                     
                     
                     ),
                  child: Row(
                    children: [
                      SizedBox(width: textWidthSize, child: const Text('Image URL',style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(
                        child: TextFormField(
                          controller: imageURLController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Something';
                            }
                            return null;
                          },
                          decoration:  InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 20.0),
                            hintText: 'Enter text',
                            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                            border: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                            ),
                            isDense: true,
                          ),
                          minLines: 1,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                 padding: const EdgeInsets.only(
                    
                        top: 20,
                     
                      bottom: 20,
                     ),
                  child: Row(
                    children: [
                      SizedBox(width: textWidthSize, child: Text('Description',style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(
                        child: TextFormField(
                          controller: descriptionController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Something';
                            }
                            return null;
                          },
                          decoration:  InputDecoration(
                           
                            contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 20.0),
                            hintText: 'Enter text',
                            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                            border: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                            ),
                            isDense: true,
                          ),
                          minLines: 1,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: myOrangeColor,
                        padding: EdgeInsets.only(left:40,right:40,top:12,bottom:12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          
                        ),
                        child: Text(
                          'CANCEL',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      MaterialButton(
                        onPressed: () async  {
                          if (_formkey.currentState!.validate()) {
                            String photographerName = nameController.text;
                            String imageURL = imageURLController.text;
                            String description = descriptionController.text;
        
                     PhotoInputApi.userData=    PhotoInputClass(name: photographerName, description: description, imageURL: imageURL,);
                      
                       await PhotoInputApi().addPhoto();
        
                        String statusCode = PhotoInputApi.resCode;
        
        // Show popup with status code
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Status Code'),
              content: Text('Response code: $statusCode'),
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
        
                     
                           
                          }
                        },
                        color: myOrangeColor,
                        padding: EdgeInsets.only(left:45,right: 45,top:12,bottom:12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          'ADD',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
         
        ),
      
      ),
    );
  }
}
