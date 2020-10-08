import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
//import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ffff/items.dart';




class UploadImage extends StatefulWidget {
  UploadImage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  int _counter = 0;
  File _image;
  String _uploadedFileURL;
  bool isLoading = false;
  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }
  Future uploadFile() async {
    setState(() {
      isLoading = true;
    });
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('${ud}/${Path.basename(_image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
        isLoading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.photo_camera,
            ),
            color: Colors.black,
          ),
          Spacer(flex: 1,),
          Padding(
            padding: const EdgeInsets.fromLTRB(3, 10, 0, 0),
            child: Text(
              'Textgram',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send),
            color: Colors.black,
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('Selected Image'),
                        _image != null
                            ? Image.file(
                          _image,
                          // height: 150,
                          height: 150,
                          width: 150,
                        )
                            : Container(
                          child: Center(
                            child: Text(
                              "No Image is Selected",
                            ),
                          ),
                          height: 150,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('Uploaded Image'),
                        _uploadedFileURL != null
                            ? Image.network(
                          _uploadedFileURL,
                          height: 150,
                          width: 150,
                        )
                            : Container(
                          child: Center(
                            child: Text(
                              "No Image is Selected",
                            ),
                          ),
                          height: 150,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            _image != null
                ? isLoading
                ? CircularProgressIndicator()
                : RaisedButton(
              child: Text('Upload Image'),
              onPressed: uploadFile,
              color: Colors.red,
            )
                : Container()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: chooseFile,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
