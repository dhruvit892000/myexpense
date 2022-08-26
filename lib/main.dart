import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myexpense/model/Transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transaction =[
    Transaction(
        id: 'abc',
        title: 'books',
        amount: 200,
        dateTime: DateTime.now(),
    ),
    Transaction(
      id: 'def',
      title: 'books1',
      amount: 2000,
      dateTime: DateTime.now(),
    ),
    Transaction(
      id: 'ghi',
      title: 'books2',
      amount: 3000,
      dateTime: DateTime.now(),
    )
  ];
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  _addTransaction(String title , double amount)
  {
     print(title);
     print(amount);
     var newTr =  Transaction(
         id: 'dhruvit',
         title: title,
         amount: amount,
         dateTime: DateTime.now()
     );
     setState(() {
       transaction.add(newTr);
     });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('myexpense'),
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Column(
              children: [
                TextField(
                  controller : titleController,
                  decoration: InputDecoration(
                    hintText: 'Title'
                  ),
                ),
                TextField(
                  controller: amountController,
                  decoration:  InputDecoration(
                    hintText: 'Amount'
                  ),
                ),
                ElevatedButton(
                onPressed:() {
                 // print(titleController.text);
                  //print(amountController.text);
                  _addTransaction(titleController.text ,  double.parse(amountController.text));
                } ,
                    child: Text('submit'))
              ],
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
               itemCount: transaction.length,
                    //itemCount: 5,
              itemBuilder: (BuildContext context , int index) {
                return ListTile(
                  leading: Text('${transaction[index].id }'),
                  title: Text('${transaction[index].title }'),
                  subtitle: Text((DateFormat.yMMMd().format(DateTime.now()))),
                  trailing: Text('${transaction[index].amount}'),
                );
              }
                /*Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${transaction[index].title }' , style: TextStyle(fontSize: 30, color: Colors.lime),),
                      Text( '${transaction[index].amount}', style: TextStyle(fontSize: 30, color: Colors.blue),),
                      Text( '${transaction[index].dateTime}',style: TextStyle(fontSize: 30, color: Colors.amberAccent),),
                  SizedBox(
                    height: 30,
                  ),
                    ],*/





                ),
        ],
      )

      );
  }
}



