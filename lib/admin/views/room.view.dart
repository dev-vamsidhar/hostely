import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hostely/models/user.model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';

class Rooms extends StatelessWidget {
  List<UserModel>? students;
  Rooms({super.key, required this.students});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 235, 235),
      appBar: AppBar(
        title: const Text("Rooms"),
        backgroundColor: kColorPrimary,
        actions: [],
      ),
      body: ListView.builder(
        itemCount: students?.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      students![index].name + "-" + students![index].phone,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Parent Phone - ${students![index].parentPhone}"),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Aadhar - ${students![index].aadhar}"),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Roll No-  ${students![index].rollNo}"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              launchUrl(
                                  Uri.parse("tel:${students![index].phone}"));
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text("Call Student",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              launchUrl(Uri.parse(
                                  "tel:${students![index].parentPhone}"));
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text("Call Parent",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
          ;
        },
      ),
    );
  }
}
