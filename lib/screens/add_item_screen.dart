
import 'package:loading/indicator/ball_scale_multiple_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:http/http.dart';
import 'dart:ui';
import 'dart:io';

import 'package:hicoffee2/sqlite/database_helper.dart';
import 'package:hicoffee2/models/item_model.dart';


class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController description = TextEditingController();
  String dropdownValue = "ماگ";
  List<Item> itemList = [];

  Color responseColor;
  String responseText;
  String category = "ماگ";
  bool sendCheck = true;
  File imageSource;
  int number = 2;
  Color goodColor = Colors.greenAccent[700];
  Color badColor = Colors.redAccent[700];

  bool itemNameController(String name){
    // False mean you can use that name
    if(name == ' ' || name == null || name == ''){
      return true;
    }else{
      return false;
    }
  }

  bool itemPriceController(String price){
    // False mean you can use that price
    if(price == ' ' || price == null || price == ''){
      return true;
    }else{
      return false;
    }
  }

  _showResponseDialog(String responseText, Color responseColor){
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(milliseconds: 700), () {
            Navigator.of(context).pop(true);
          });
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.black87),
              ),
              title: Center(
                child: Text(
                  responseText,
                  style: TextStyle(
                    fontFamily: "BNazanin",
                    fontSize: 23.0,
                    fontWeight: FontWeight.w600,
                    color: responseColor,
                  ),
                ),
              ),
            ),
          );
        }
    );
  }

  _showLoadingDialog(){
    showDialog(
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.black87),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Loading(
                      indicator: BallScaleMultipleIndicator(),
                      size: 60.0,
                      color: Colors.blue[300],
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "در حال ارسال اطلاعات . . .",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "BNazanin",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  _commentButton(){
    return IconButton(
      icon: Icon(FontAwesomeIcons.commentDots),
      iconSize: 26.0,
      color: Colors.blueGrey[500],
      splashColor: Colors.lightBlue[100],
      onPressed: (){
        showDialog(
            context: context,
            builder: (context) {
              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.black87),
                  ),
                  title: Column(
                    children: <Widget>[
                      Center(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            controller: description,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.newline,
                            maxLines: 4,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "BNazanin",
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              hintText: "توضیحات",
                              contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),

                          ),
                        ),
                      ),
                      FlatButton(
                        child: Text(
                          "ثبت",
                          style: TextStyle(
                            fontFamily: "BNazanin",
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: goodColor,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
        );
      },
    );
  }

  _categoryView(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 10.0),
            Text(
              "دسته بندی: ",
              style: TextStyle(
                  color: Colors.black54
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),
          child: DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.blue[300]
              ),
              iconSize: 42,
              underline: SizedBox(),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>[
                'ماگ',
                'دونه قهوه',
                'نوشیدنی',
                'شکلات',
                "وسایل",
                "غیره",
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()),
        ),
      ],
    );
  }

  Future<StreamedResponse> sendPostRequest() async{
    try{
      String image_url;
      String url = "http://al1.best:89/api/add-item/";

      if(imageSource != null){
        image_url = imageSource.path;
      }else{
        image_url = null;
      }
      // Create a request
      var request = MultipartRequest('POST', Uri.parse(url));

      // Add Request Body
      if(image_url != null){
        request.files.add(
            await MultipartFile.fromPath(
                'image_url',
                image_url
            )
        );
      }
      request.fields['name'] = nameController.text;
      request.fields['category'] = category;
      request.fields['number'] = number.toString();
      request.fields['price'] = priceController.text;
      request.fields['description'] = description.text;

      Map<String, dynamic> myBody = {
        "name": nameController.text,
        "category": category,
        "number": number,
        "price": int.parse(priceController.text),
        "description": description.text,
        "image_url": image_url,
      };
      final response = await request.send();
      print(response.statusCode);
      final respStr = await response.stream.bytesToString();
      print("res: $respStr");
      print("statusCode: ${response.statusCode}");

      // Insert it on local db
      if (response.statusCode == 200){
        insertItem(myBody);
      }

      return response;
    }
    on Exception catch (exception){
      print("Exception: $exception");
      responseText = 'خطا';
      responseColor = badColor;
      _showResponseDialog(responseText, responseColor);
      return null;
    }
  }

  void insertItem(Map<String, dynamic> newItem)async{
    //‌ If HTTP Header Was 'OK' Insert item it on local database
    Item item;
    item = Item.fromJson(newItem);
    var result = await DatabaseHelper().insertItem(item);

    // Add it on list for response back
    itemList.add(item);
//    await Navigator.maybePop(context, itemList);
    print("Insert Result: $result");
  }

  void tryAddItem() async{
    sendCheck = false;
    bool checkName = await DatabaseHelper().checkItemName(nameController.text); // False mean you can use that username
    print("checkName: $checkName");

    if(itemNameController(nameController.text) || itemPriceController(priceController.text) || checkName){
      if(checkName){
        responseText = '.نام محصول تکراری است';
        responseColor = badColor;

      }else if(itemNameController(nameController.text)){
        responseText = '.نام محصول را پر کنید';
        responseColor = badColor;

      }else{
        responseText = '.قیمت را پر کنید';
        responseColor = badColor;
      }
      _showResponseDialog(responseText, responseColor);
      sendCheck = true;

    }else{
      _showLoadingDialog();
      StreamedResponse response = await sendPostRequest();

      if(response != null){
        Navigator.of(context).pop();
        if(response.statusCode == 200){
          responseText = 'ثبت شد';
          responseColor = goodColor;
          setState(() {
            nameController = TextEditingController();
            priceController = TextEditingController();
            description = TextEditingController();
          });

        }else{
          responseText = '${response.statusCode} خطا ';
          responseColor = badColor;
        }
        _showResponseDialog(responseText, responseColor);
      }
      sendCheck = true;
    }
  }

  _takeImageGallery() async{
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageSource = picture;
      Navigator.of(context).pop();
      if(imageSource != null){
        _showResponseDialog("عکس ثبت شد",goodColor);
      }
    });
  }

  _takeImageCamera() async{
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageSource = picture;
      Navigator.of(context).pop();
      if(imageSource != null){
        _showResponseDialog("عکس ثبت شد",goodColor);
      }
    });

  }

  _imageBuilder(){
    if (imageSource == null){
      return Text(
        "Image Not Found",
        style: TextStyle(
          fontSize: 10.0,
        ),
      );
    }else{
      print(imageSource);
      return Image.file(
        imageSource,
        height: 100.0,
        width: 100.0,
        fit: BoxFit.cover,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage("assets/images/add_item_background.jpg"),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment(0.2, 0),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: Colors.black87,
                      width: 1,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: "BNazanin",
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  hintText: "نام محصول",
                                  contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: priceController,
                                autofocus: false,
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                textInputAction: TextInputAction.go,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: "BNazanin",
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  hintText: "قیمت",
                                  contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            _categoryView(),
                            Row(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 10.0),
                                    Text(
                                      "تعداد:",
                                      style: TextStyle(
                                          color: Colors.black54
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 35.0),
                                Container(
                                  height: 50,
                                  child: NumberPicker.horizontal(
                                      initialValue: number,
                                      minValue: 1,
                                      maxValue: 200,
                                      selectedValueColor: Colors.blue[400],
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0),
                                        border: Border.all(color: Colors.blue[100], width: 1.3 )
                                      ),
                                      highlightSelectedValue: true,
                                      onChanged: (newValue) =>
                                          setState(() => number = newValue)
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 25.0, 8.0, 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  _commentButton(),
                                  RaisedButton(
                                    color: Colors.greenAccent[200],
                                    child: Text(
                                      "ثبت",
                                      style: TextStyle(
                                        fontFamily: "BNazanin",
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onPressed: () {
                                      if(sendCheck){
                                        tryAddItem();
                                      }
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(FontAwesomeIcons.cameraRetro),
                                    iconSize: 26.0,
                                    color: Colors.blueGrey[500],
                                    splashColor: Colors.lightBlue[100],
                                    onPressed: (){
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return BackdropFilter(
                                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                              child: AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30.0),
                                                  side: BorderSide(color: Colors.black87),
                                                ),
                                                title: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: <Widget>[
                                                    IconButton(
                                                      icon: Icon(FontAwesomeIcons.camera),
                                                      iconSize: 33.0,
                                                      color: Colors.blueGrey[500],
                                                      splashColor: Colors.lightBlue[300],
                                                      onPressed: () => _takeImageCamera(),
                                                    ),
                                                    _imageBuilder(),
                                                    IconButton(
                                                      icon: Icon(FontAwesomeIcons.image),
                                                      iconSize: 33.0,
                                                      color: Colors.blueGrey[500],
                                                      splashColor: Colors.lightBlue[100],
                                                      onPressed: () => _takeImageGallery(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }
                                      );
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30.0,
            left: 10.0,
            child: IconButton(
              icon: Icon(Icons.keyboard_arrow_down),
              color: Colors.black,
              iconSize:37.0,
              onPressed: () => Navigator.pop(context, itemList),
            ),
          ),
        ],
      ),
    );
  }
}
