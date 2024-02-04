import 'package:auto_ch_tech_assesment/presentation/bloc/all_cars/all_car_bloc.dart';
import 'package:auto_ch_tech_assesment/presentation/bloc/car_details/car_details_bloc.dart';
import 'package:auto_ch_tech_assesment/presentation/car_details/car_details_screen.dart';
import 'package:auto_ch_tech_assesment/widgets/slider_card_.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

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
                  .map((car) => CardDouble(
                        carList: car,
                        onTap: () {
                          Get.to(() => CarDetailsScreen(
                                carId: car.id!,
                              ));
                        },
                      ))
                  .toList());
        } else {
          return const Text("Something went wrong");
        }
      },
    );
  }
}
