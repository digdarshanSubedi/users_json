import 'package:flutter/material.dart';
import 'package:http_requests/model/user.dart';
import 'package:http_requests/services/http_service.dart';

void main(){
runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: Text("Search ......"),

        ),
        body: FutureBuilder<List<User>>(
          future: HttpService().getUsers(),
          builder: ( context,  snapshot) {
          
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.network(snapshot.data [index].avatar),
                  title: Text('${snapshot.data[index].firstName} ${snapshot.data[index].lastName}'),// interpolation
                  subtitle: Text(snapshot.data[index].email),
                );
               },
              
              );
            }
            else {
              return Center(
                child:  CircularProgressIndicator(

                ),
              );
            }
          },
        ),
      ),
    );
  }
}