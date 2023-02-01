// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_core/firebase_core.dart' as firebase_core;

// class slider extends StatefulWidget {
//   @override
//   State<slider> createState() => _sliderState();
// }

// class _sliderState extends State<slider> {
//   // const slider({Key? key}) : super(key: key);
//    final x = FirebaseStorage.instance ;
//    final referance  = FirebaseStorage.instance.ref().child("sliderImages").listAll();

//   // late List<String> imageUrls ;
//   // Future<List<String>> getImageUrls() async {
//   //   final ref = FirebaseStorage.instance.ref().child("sliderImages");
//   //   final snapshots = await ref.listAll();

//   //   for (var snapshot in snapshots.items) {
//   //     final url = await snapshot.getDownloadURL();
//   //     imageUrls.add(url);
//   //   }
//   //     print(imageUrls.length) ; 
//   //   return imageUrls;
//   // }
   
//   Future<String> downloadUrl (String image)async{
//         String downloadUrl = await FirebaseStorage.instance.ref('sliderImages/${image}' ).getDownloadURL();
//         return downloadUrl ; 

//   }
//   @override
//   int activeIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         FutureBuilder(
//         future: referance.downloadUrl("1st.jpeg"),
//         builder: (context,AsyncSnapshot snapshot) {
//           if (snapshot.hasData) {
//             final files = snapshot.data!.items  ; 
//               return  CarouselSlider.builder(
//           itemCount:snapshot.data!.items.length,
//           options: CarouselOptions(
//             autoPlay: true,
//             onPageChanged: (index, reason) =>
//                 setState(() => activeIndex = index),  
//             viewportFraction: 0.97,
//             initialPage: 0,
//             enlargeCenterPage: true,
//           ),
//           itemBuilder: (BuildContext context, int index, int page) {
//              final url =  snapshot.data!.items[index].getDownloadURL();
//              final url1 = 'sliderImages/${url}' ; 
//             return Container(
//               width: double.infinity,
//               height: double.infinity,
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 elevation: 40,
//                 shadowColor: Color.fromARGB(0, 216, 55, 55),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image(
//                       image: NetworkImage('${url1}'), fit: BoxFit.cover),
//                 ),
//               ),
//             ); } ); 
//             // return Container(
//             //   height: 100,
//             //   child: ListView.builder(itemCount: files.length  , itemBuilder: (context , index){
//             //        final file = files[index]. getDownloadURL(); 
//             //        print(file);
//             //         return Text("${file}");
//             //         // trailing: IconButton(onPressed: (){
//             //         //   Text("${file}"); 
//             //         // }, icon: Icon(Icons.download)),
//             //         // ) ; 
//             //   }),
//             // );
//           } else if (snapshot.hasError) {
//             return Text("Error Occured");
//           }
//           else{
//             return CircularProgressIndicator () ; 
//           }
//         },
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         BuildIndicator(activeIndex),
//       ],
//     );
//   }
//   Widget BuildIndicator(int activeIndex) {
//   return AnimatedSmoothIndicator(
//     activeIndex: activeIndex,
//     count:5 ,
//     effect: SlideEffect(
//         spacing: 8.0,
//         radius: 8.0,
//         dotWidth: 12.0,
//         dotHeight: 12.0,
//         paintStyle: PaintingStyle.stroke,
//         strokeWidth: 1.5,
//         dotColor: Colors.grey,
//         activeDotColor: Color.fromARGB(255, 76, 107, 175)),
//   );
// }

// }

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

List<String> Images = [
  "assets/images/1.jpg" ,
   "assets/images/2.png" ,
    "assets/images/3.jpeg" ,
      "assets/images/5_1.jpg" ,
];

class slider extends StatefulWidget {
  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  // const slider({Key? key}) : super(key: key);
  @override
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          // height: 300,
          width: double.infinity,
          child: CarouselSlider.builder(
            itemCount: Images.length,
            options: CarouselOptions(
              autoPlay: true,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
              viewportFraction: 0.97,
              initialPage: 0,
              enlargeCenterPage: true,
            ),
            itemBuilder: (BuildContext context, int Index, int page) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 40,
                  shadowColor: Color.fromARGB(0, 216, 55, 55),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                        image: AssetImage(Images[Index]), fit: BoxFit.cover),
                  ),
                ),
              );
              ;
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        BuildIndicator(activeIndex),
       
      ],
    );
  }

 
}
 Widget BuildIndicator(int activeIndex ) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: Images.length,
      effect: SlideEffect(
          spacing: 8.0,
          radius: 8.0,
          dotWidth: 12.0,
          dotHeight: 12.0,
          paintStyle: PaintingStyle.stroke,
          strokeWidth: 1.5,
          dotColor: Colors.grey,
          activeDotColor: Color.fromARGB(255, 76, 107, 175)),
    );
  }