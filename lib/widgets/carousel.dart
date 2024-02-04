import 'package:auto_ch_tech_assesment/presentation/bloc/all_cars/all_car_bloc.dart';
import 'package:auto_ch_tech_assesment/widgets/hero_carousel_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCarBloc, AllCarState>(
      builder: (context, state) {
        if (state is AllCarLoading) {
          return const SizedBox(
            height: 50,
            child: CircularProgressIndicator(),
          );
        } else if (state is AllCarLoaded) {
          return CarouselSlider(
              options: CarouselOptions(
                  height: 550,
                  autoPlay: true,
                  aspectRatio: 1.5,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height),
              items: state.carList
                  .map((car) => CardDouble(carList: car))
                  .toList());
        } else {
          return const Text("Something went wrong");
        }
      },
    );
  }
}
