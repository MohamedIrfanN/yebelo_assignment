import 'dart:convert';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
import 'package:yebelo/Models/model.dart';
import 'package:flutter/services.dart' as rootBundle;
class TamilNadu extends StatefulWidget {


  @override
  _TamilNaduState createState() => _TamilNaduState();
}

class _TamilNaduState extends State<TamilNadu> {
  List<int> qty = [0,0,0,0];
  List<Color?> color = [Colors.red[300],Colors.yellow[300],Colors.yellow[300],Colors.orange[300]];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<ProductList>;
            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return items[index].pCategory.toString() == 'Tamilnadu'?Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                    child: Container(
                      height: 265,
                      child: Row(
                        children: [
                          Container(
                            height: 265,
                            width: 150,
                            decoration: BoxDecoration(color: color[index%4],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: shadowList,
                            ),
                            margin: EdgeInsets.only(top: 50),
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Container(
                                  child: Image.asset(items[index].pImage.toString(),width: 1,height: 1,)
                              ),
                            ),
                          ),
                          Expanded(child: Container(
                            margin: EdgeInsets.only(top: 60,bottom: 20),
                            decoration: BoxDecoration(color: Colors.white,

                                boxShadow: shadowList,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)

                                )
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 9),
                                        child: Column(
                                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(items[index].pName.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                                            SizedBox(
                                              height: 9,
                                            ),
                                            if(items[index].pDetails.toString() != 'null')
                                              Text(items[index].pDetails.toString(),style: TextStyle(color: Colors.black54),),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            if(items[index].pCategory.toString() != "null")
                                              Text("Category  :  ${items[index].pCategory.toString()}",style: TextStyle(fontWeight: FontWeight.w500),),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text("Availability : ${items[index].pAvailability.toString()}"),
                                            SizedBox(
                                              height: 4,
                                            ),



                                            Row(
                                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(width: 20,),
                                                Text("Quantity :    "),
                                                InkWell(
                                                  onTap: (){
                                                    if(qty[index] != 0){
                                                      setState(() {
                                                        qty[index]--;
                                                      });
                                                    }
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey,
                                                        shape: BoxShape.circle
                                                    ),
                                                    child: Icon(Icons.arrow_left_rounded,color: Colors.black,size: 25,),
                                                  ),
                                                ),

                                                SizedBox(width: 10,),
                                                Text(qty[index].toString()),
                                                SizedBox(width: 10,),
                                                InkWell(
                                                  onTap: (){
                                                    setState(() {
                                                      if(qty[index]<items[index].pAvailability!.toInt())
                                                        qty[index]++;
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey,
                                                        shape: BoxShape.circle
                                                    ),
                                                    child: Icon(Icons.arrow_right_rounded,color: Colors.black,size: 25,),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(width: 20,),
                                                Text("RS : ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.green),),
                                                Text(items[index].pCost.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.green)),
                                                SizedBox(width: 50,),
                                                InkWell(
                                                  onTap: () async{
                                                    return showDialog(
                                                      context: context,
                                                      builder: (ctx) => AlertDialog(
                                                        title: Text("Json Data"),
                                                        content: Text("${jsonEncode(items[index])}"),
                                                        actions: <Widget>[
                                                          FlatButton(
                                                            onPressed: () {
                                                              Navigator.of(ctx).pop();
                                                            },
                                                            child: Text("okay"),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                                    decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius: BorderRadius.circular(20)
                                                    ),
                                                    child: Text("Buy",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),

                                          ],
                                        ),
                                      )
                                  ),
                                ),

                              ],
                            ),

                          ))

                        ],
                      ),

                    ),
                  ) :
                  Container();
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }









  Future<List<ProductList>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('assets/productlist.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ProductList.fromJson(e)).toList();
  }
  List<BoxShadow> shadowList = [
    BoxShadow(color: Colors.grey[300]!, blurRadius: 30, offset: Offset(0, 10))
  ];
}
