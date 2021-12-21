import 'package:consumedata/model/user_model.dart';
import 'package:flutter/material.dart';

class DetailIncidentChiefReportScreen extends StatelessWidget {
  final User user;
  DetailIncidentChiefReportScreen({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 80.0),
        Row(
          children: [
            Text(
              user.firstName ?? "tidak ada data",
              style: TextStyle(color: Colors.white, fontSize: 26.0),
            ),
            SizedBox(width: 5,),
            Text(
              user.lastName ?? "tidak ada data",
              style: TextStyle(color: Colors.white, fontSize: 26.0),
            ),
          ],
        ),
        Container(
          width: 200,
          child: new Divider(color: Colors.green),
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              color: Colors.blue
              // image: new DecorationImage(
              //   image: new AssetImage("assets/images/incidentExample.png"),
              //   fit: BoxFit.cover,
              // ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final firstNameData = Text(
      user.firstName ?? '',
      style: TextStyle(fontSize: 16.0),
    );
    final lastNameData = Text(
      user.lastName ?? '',
      style: TextStyle(fontSize: 16.0),
    );
    final emailData = Text(
      user.email ?? '',
      style: TextStyle(fontSize: 16.0),
    );
   


    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email", style: TextStyle(fontSize: 14)),
              Container(
                  width: 160,
                  child: Divider(
                    thickness: 5,
                  )),
              emailData,
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("First Name", style: TextStyle(fontSize: 14)),
              Container(
                  width: 160,
                  child: Divider(
                    thickness: 5,
                  )),
              firstNameData,
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Last Name", style: TextStyle(fontSize: 14)),
              Container(
                  width: 160,
                  child: Divider(
                    thickness: 5,
                  )),
              lastNameData,
            ],
          ),
          SizedBox(
            height: 30,
          ),
         // approveButton
        ],
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[topContent, bottomContent],
        ),
      ),
    );
  }
}
