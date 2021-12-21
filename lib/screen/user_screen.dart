import 'package:consumedata/model/user_model.dart';
import 'package:consumedata/services/user_api.dart';
import 'package:consumedata/widget/listing_user_widget.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({ Key key }) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}


class _UserScreenState extends State<UserScreen> {

  //define variable
  final UserListingApi api = UserListingApi();
  List<User> user = [];

  Future loadList() async {
    String _noDataText;

    await Future.delayed(const Duration(seconds: 1));

    Future<List<User>> userList = api.getListUser();
   
    userList.then((user) {
      if (mounted) {
        setState(() {
          this.user = user;
        });
        return userList;
      } else {
        print("no data");
        return null;
      }
    });
  }

  String _title = "List User ReqRes.in";
  
  @override
  Widget build(BuildContext context) {
  double _width = MediaQuery.of(context).size.width;
  double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      body: SafeArea(
        child: Container(
          color: Colors.blueGrey,
          width: _width,
          height: _height,
           child: new FutureBuilder(
                  future: loadList(),
                  builder: (context, snapshot) {
                    return user.length > 0 ? ListingUserWidget(
                     user: user,
                       ) : Center(child: Text("Tidak ada user"));
                    // if (snapshot.connectionState == ConnectionState.waiting) {
                    //   print("waiting to server");
                    //   Center(child: Text("Waiting to server"));
                    // }
                    // if (snapshot.hasError) {
                    //   return Text(snapshot.error.toString());
                    // } else {
                    //   return new IncidentChiefListWidget(
                    //     incident: incident,
                    //   );
                    // }
                  })
          
        ),
      ),
    );
  }
}