import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final imageList = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.png',
    'assets/4.jpg',
  ];

  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20)
  );

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('409631016_image'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildPhotoView(context),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _buildNextButton(),
                ),
                Expanded(
                  child: _buildLastButton(),
                )
              ],
            )
          )

        ],
      ),


    );
  }

  PhotoViewGallery _buildPhotoView(BuildContext context){
    return PhotoViewGallery.builder(
      itemCount: imageList.length,
      builder: (context, index){
        return PhotoViewGalleryPageOptions(
          imageProvider: AssetImage(
            imageList[index],
          ),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 2,
        );
      },
      scrollPhysics: BouncingScrollPhysics(),
      backgroundDecoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
      ),
    );
  }

  ElevatedButton _buildNextButton(){
    return ElevatedButton(
      child: Text('上一張'),
      onPressed: (){
        final snackBar = SnackBar(
          content: Text('你按下圖片'),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.blueGrey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          action: SnackBarAction(
            label: "Toast訊息",
            textColor: Colors.white,
            onPressed: () =>
                Fluttertoast.showToast(
                    msg: '你按下圖片',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.blueGrey,
                    textColor: Colors.white,
                    fontSize: 20
                ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    );
  }

  ElevatedButton _buildLastButton(){
    return ElevatedButton(
        child: Text('下一張'),
        onPressed: (){
          final snackBar = SnackBar(
            content: Text('你按下圖片'),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.blueGrey,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            action: SnackBarAction(
              label: "Toast訊息",
              textColor: Colors.white,
              onPressed: () =>
                  Fluttertoast.showToast(
                      msg: '你按下圖片',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.blueGrey,
                      textColor: Colors.white,
                      fontSize: 20
                  ),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
    );
  }

}
