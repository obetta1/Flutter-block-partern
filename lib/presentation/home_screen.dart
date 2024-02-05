import 'package:auto_ch_tech_assesment/core/theme/app_colors.dart';
import 'package:auto_ch_tech_assesment/core/utils/utils.dart';
import 'package:auto_ch_tech_assesment/domain/repository/repository.dart';
import 'package:auto_ch_tech_assesment/domain/usecase/all_car_usecase.dart';
import 'package:auto_ch_tech_assesment/domain/usecase/popular_make_usecase.dart';
import 'package:auto_ch_tech_assesment/presentation/bloc/all_cars/all_car_bloc.dart';
import 'package:auto_ch_tech_assesment/presentation/bloc/popular_car_makes/popular_car_make_bloc.dart';
import 'package:auto_ch_tech_assesment/widgets/carousel.dart';
import 'package:auto_ch_tech_assesment/widgets/custom_bottom_bar.dart';
import 'package:auto_ch_tech_assesment/widgets/custom_image_view.dart';
import 'package:auto_ch_tech_assesment/widgets/product_card_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/app_export.dart';
import '../widgets/app_bar/custom_appbar.dart';
import '../widgets/custom_search_view.dart';
import '../widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scafoldBg,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PopularCarMakeBloc(
              getPopularCarMakeUsecase:
                  PopularCarMakeUseCase(repository: Repository()),
            )..add(LoadPopularCarMakeEvent()),
          ),
          BlocProvider(
            create: (context) =>
                AllCarBloc(AllCarUseCase(Repository()))..add(LoadAllCarEvent()),
          ),
        ],
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 80.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Explore'),
                    centerTitle: true,
                    background: Container(
                      color: Colors
                          .white, // You can set your desired background color
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      CustomSearchField(),
                      SizedBox(height: 20),
                      BlocBuilder<PopularCarMakeBloc, PopularCarMakeState>(
                        builder: (context, state) {
                          print('Received state: $state');

                          if (state is PopularCarMakeLoading) {
                            return showProgressBar();
                          } else if (state is PopularCarMakeLoaded) {
                            return Column(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0.0, 2.0),
                                            blurRadius: 4.0,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const CustomTextWithBorder(
                                            text: 'Popular Brands',
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            bordderRadius: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 28.0, vertical: 10),
                                            child: Wrap(
                                              spacing: 10.0,
                                              runSpacing: 8.0,
                                              children: List.generate(
                                                state.makeList.length,
                                                (index) {
                                                  if (state
                                                      .makeList[index].imageUrl!
                                                      .endsWith(".svg")) {
                                                    return Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        color: AppColors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black26,
                                                            offset: Offset(
                                                                0.0, 2.0),
                                                            blurRadius: 4.0,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child:
                                                            SvgPicture.network(
                                                          state.makeList[index]
                                                              .imageUrl!,
                                                          height: 20,
                                                          width: 20,
                                                          placeholderBuilder:
                                                              (BuildContext
                                                                      context) =>
                                                                  showProgressBar(),
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        color: AppColors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black26,
                                                            offset: Offset(
                                                                0.0, 2.0),
                                                            blurRadius: 4.0,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: CustomImageView(
                                                          height: 20,
                                                          width: 20,
                                                          radius: BorderRadius
                                                              .circular(20),
                                                          imagePath: state
                                                              .makeList[index]
                                                              .imageUrl,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CustomCarousel(),
                                  ],
                                ),
                              ],
                            );
                          } else if (state is CarMakeError) {
                            return Center(
                                child: Text('Error: ${state.errorMessage}'));
                          } else {
                            return Center(
                                child: Text(
                                    'Unknown State: ${state.runtimeType}'));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// CustomAppBar widget is positioned outside the CustomScrollView
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomAppBar(
                showIcon: true,
                title: 'Explore',
                leadingIcon: IconButton(
                  iconSize: 30,
                  onPressed: () {
                    // Navigator.pushNamed(context, '/wishlist');
                  },
                  icon: Icon(
                    Icons.grid_view_rounded,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        onChanged: (home) {},
      ),
    );
  }
}
