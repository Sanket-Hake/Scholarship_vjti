import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:scholarship_vjti/Activity_Status/registration.dart';
import 'package:scholarship_vjti/Home/slider.dart';

import '../Documents/required.dart';
import 'drawer.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 97, 49, 218),
        elevation: 30,
        title: const Center(
          child: Text("Scholarship"),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: FadeInDownBig(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                slider(),
                 SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/first");}, 
                          child: column(
                              "assets/images/history.png", "Activity Status", context)),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        // onTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => NewsPage(),
                        //     ),
                        //   );
                        // },
                        child: column(
                            "assets/images/diagram.png", "All Schemes", context),
                      ),
                    )
                  ],
                ),
                 SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        child: column("assets/images/notice.png",
                            "Important Notice", context),
                        // onTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const BaazarBhav(),
                        //     ),
                        //   );
                        // },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  document(),
                            ),
                          );
                        },
                        child: column("assets/images/paper.png",
                            "Required Documents", context),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  
Widget column(String image, String text, BuildContext context) {
  return Container(
    child: Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
          width: MediaQuery.of(context).size.width / 4,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.contain),
          ),
        ),
        Text(
          text,
          style: const TextStyle(
              color: Color.fromARGB(255, 76, 76, 175), fontWeight: FontWeight.w600, fontSize: 17),
        ),
      ],
    ),
  );
}

}
