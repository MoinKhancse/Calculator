import 'package:flutter/material.dart';

main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: HomePag(),
    );
  }
}
class HomePag extends StatefulWidget {
  const HomePag({super.key});

  // const HomePag({Key? key}) : super(key: key);

  @override
  State<HomePag> createState() => _HomePagState();
}

class _HomePagState extends State<HomePag> {

  var firstnum;
  var secondnum;
  String texttodisplay="";
  var res;
  var operator;
  void btnclicked(String btnval){
    if(btnval=="C"){
      texttodisplay="";
      firstnum=0;
      secondnum=0;
      res="";
    }
    else if(btnval=="+"||btnval=="-"||btnval=="X"||btnval=="/"){
    firstnum=int.parse(texttodisplay);
    res="";
    operator=btnval;
    }
    else if(btnval=="="){
      secondnum=int.parse(texttodisplay);
      if(operator=="+"){
        res =(firstnum + secondnum).toString();
      }
      if(operator=="-"){
        res =(firstnum - secondnum).toString();
      }
      if(operator=="X"){
        res =(firstnum * secondnum).toString();
      }
      if(operator=="/"){
        res =(firstnum / secondnum).toString();
      }
    }
    else{
      res=int.parse(texttodisplay + btnval).toString();
    }
    setState(() {
      texttodisplay= res;
    });
    }

  Widget custombutton(String btnval){
    return Expanded(
        child: OutlinedButton(

          onPressed: ()=>btnclicked(btnval),
          child: Text(
              "$btnval",
              style: TextStyle(fontSize: 30.0)),
        ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            title: Text("Calculator",style: TextStyle(fontSize: 30.0),),
            centerTitle: true,
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:<Widget> [
                Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      alignment: Alignment.bottomRight,
                      child: Text("$texttodisplay",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600),
                      ),
                    ),
                ),
                Row(
                  children: <Widget>[
                    custombutton("9"),
                    custombutton("8"),
                    custombutton("7"),
                    custombutton("+"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    custombutton("6"),
                    custombutton("5"),
                    custombutton("4"),
                    custombutton("-"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    custombutton("3"),
                    custombutton("2"),
                    custombutton("1"),
                    custombutton("X"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    custombutton("C"),
                    custombutton("0"),
                    custombutton("="),
                    custombutton("/"),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}

