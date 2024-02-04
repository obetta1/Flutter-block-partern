import 'package:auto_ch_tech_assesment/presentation/bloc/car_details/car_details_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/utils.dart';
import '../../domain/repository/repository.dart';
import '../../domain/usecase/car_deetail_usecase.dart';
import '../../widgets/app_bar/custom_appbar.dart';
import 'car_detail_widgets.dart';
import 'car_fetures.dart';
import 'car_spec_widget.dart';

class CarDetailsScreen extends StatefulWidget {
  final String carId;
  const CarDetailsScreen({super.key, required this.carId});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocProvider(
        create: (context) => CarDetailsBloc(
            carDetailsUseCase: CarDetailsUseCase(repository: Repository()))
          ..add(LoadCarDetailsEvent(id: widget.carId)),
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 80.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: Colors
                          .white, // You can set your desired background color
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  BlocBuilder<CarDetailsBloc, CarDetailsState>(
                      builder: (context, state) {
                    if (state is CarDetailsloading) {
                      return showProgressBar();
                    } else if (state is CarDetailsLoaded) {
                      return Column(
                        children: [
                          CarDetailImageCard(
                            width: w,
                            height: h,
                            carDetails: state.carDetails,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CarSpecTile(
                            carDetails: state.carDetails,
                          ),
                        ],
                      );
                    } else if (state is CarDetailsError) {
                      return Center(
                          child: Text('Error: ${state.errorMessage}'));
                    } else {
                      return const Center(child: Text('Error: Unknow state'));
                    }
                  })
                ]))
              ],
            ),
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomAppBar(
                showIcon: true,
                title: 'Explore',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
