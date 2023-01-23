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