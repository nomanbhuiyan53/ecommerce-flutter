import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({
    super.key,
  });

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final ValueNotifier<int> _selectionIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 180.0,onPageChanged: (index,reason){
            _selectionIndex.value = index;
          },),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                        color: AppColors.themeColor
                    ),
                    alignment: Alignment.center,
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8,),
        ValueListenableBuilder(
          valueListenable: _selectionIndex,
          builder: (context,currentIndex,_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i = 0; i<5;i++)
                  Container(
                    height: 10,
                    width: 10,
                    margin: EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                        color: currentIndex == i ? AppColors.themeColor : null,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.grey )
                    ),
                  )
              ],
            );
          }
        )
      ],
    );
  }
  @override
  void dispose() {
    _selectionIndex.dispose();
    super.dispose();
  }
}
