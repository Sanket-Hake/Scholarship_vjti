import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:scholarship_vjti/widgets/theme.dart';

import '../widgets/myAppBar.dart';
class document extends StatelessWidget {
  List<String> requiredDocs = <String>[
  '1) Cap allotment letter',
  '2) College fee receipt',
  '3) Marksheet of SSC(10th std)',
  '4) Marksheet of HSC(12th std)',
  '5) Previous Year Marksheet',
  '6) All semester Marksheets',
  '7) Caste Certificate',
  '8) Income Certificate of current financial year(from Tehsildar)',
  '9) Bank Passbook',
  '10) Self Declaration',
  '11) Domicile Certificate',
  '12) Rashan Card',
  '13) Hostel Certificate(if Required)',
  '14) Gap Certificate(if Required)',
  '15) Handicap Certificate(if Required)',
];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            appBar: MyAppBar(title: "Required Documents"),
          body: StreamBuilder(
      
      builder: (context, snapshot) {
       
       
        return FadeInDown(
          delay: Duration(milliseconds: 800),
          child: 
              ListView.builder(
                  itemCount: requiredDocs.length,
                  itemBuilder: (BuildContext context, int index) {
                    // print(Value[index]["category"]) ;
                  
                          return Stack(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ProductDetailPage(
                            //       ProductImage: Value[index]["ProductImage"],
                            //       Cost: Value[index]["Cost"],
                            //       productName: Value[index]["Product Name"],
                            //       dis: Value[index]["dis"],
                            //       ShopName: Shop,
                            //     ),
                            //   ),
                            // );
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 16, right: 16, top: 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                )),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.only(right: 8, top: 4),
                                          child: Text(
                                            requiredDocs[index],
                                            maxLines: 2,
                                            softWrap: true,
                                            style: CustomTextStyle
                                                .textFormFieldSemiBold
                                                .copyWith(fontSize: 20),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                      ],
                                    ),
                                  ),
                                  flex: 100,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                    }
                    
                  )
             
        );
      },
    )
        ),
      ),
    );
  }
}

class Texttitle extends StatelessWidget {
  Texttitle({required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20.0,
      ),
    );
  }
}