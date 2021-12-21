import 'package:consumedata/model/user_model.dart';
import 'package:flutter/material.dart';

import 'detail_user_widget.dart';

class ListingUserWidget extends StatelessWidget {
  final List<User> user;
  ListingUserWidget({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          // color: klixFieldInput,
          ListView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: user.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(64, 75, 96, .9)),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailIncidentChiefReportScreen(
                                        user: user[index],
                                      )),
                            );
                          },
                          child: ListTile(
                            title: Text(
                              user[index].firstName != null
                                  ? user[index].firstName
                                  : "no data",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          

                            subtitle: Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      // tag: 'hero',
                                      child:  Container(
                                              // height: 90,
                                              //width: 100,
                                              color: Colors.blue,
                                              child: Text(
                                                user[index].email != null
                                  ? user[index].email
                                  : "no data",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 11),
                                              ))
                                         
                                    )),
              
                              ],
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white, size: 20.0),
                          ),
                        ),
                      ),
                    ));
              }),
    );
  }

}
