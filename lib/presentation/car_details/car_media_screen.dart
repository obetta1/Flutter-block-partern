import 'package:auto_ch_tech_assesment/core/utils/utils.dart';
import 'package:auto_ch_tech_assesment/domain/repository/repository.dart';
import 'package:auto_ch_tech_assesment/domain/usecase/car_media_usecase.dart';
import 'package:auto_ch_tech_assesment/presentation/bloc/car_media/car_media_bloc.dart';
import 'package:auto_ch_tech_assesment/widgets/custom_image_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../core/app_export.dart';
import '../../widgets/video_player_widget.dart';

class CarMediaScreen extends StatelessWidget {
  final String carId;
  const CarMediaScreen({super.key, required this.carId});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Car Media"),
      ),
      body: BlocProvider(
        create: (context) => CarMediaBloc(
            getCarMediaUseCAse: CarMediaUseCAse(repository: Repository()))
          ..add(LoadCarMediaEvent(id: carId)),
        child: BlocBuilder<CarMediaBloc, CarMediaState>(
          builder: (context, state) {
            if (state is CarMediaLoading) {
              return showProgressBar();
            } else if (state is CarMediaLoaded) {
              return Center(
                child: CarouselSlider(
                    options: CarouselOptions(
                        height: height,
                        autoPlay: true,
                        aspectRatio: 1.5,
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        autoPlayInterval: Duration(seconds: 5),
                        enlargeStrategy: CenterPageEnlargeStrategy.height),
                    items: state.makeList.map(
                      (med) {
                        if (med.url!.endsWith('.mp4')) {
                          return Container(
                            width: width,
                            child: VideoPlayerWidget(
                              videoUrl: med.url!,
                            ),
                          );
                        } else {
                          return SvgAndImageView(url: med.url!, width: width);
                        }
                      },
                    ).toList()),
              );
            } else if (state is CarMediaError) {
              return Center(
                  child: Text(
                state.errorMessage,
              ));
            } else {
              return const Center(
                child: Text("Unknown state emitted"),
              );
            }
          },
        ),
      ),
    );
  }
}

class NetworkImageWithVideo extends StatefulWidget {
  final String imageUrl;
  final String videoUrl;

  NetworkImageWithVideo({required this.imageUrl, required this.videoUrl});

  @override
  _NetworkImageWithVideoState createState() => _NetworkImageWithVideoState();
}

class _NetworkImageWithVideoState extends State<NetworkImageWithVideo> {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.network(widget.videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      aspectRatio: 16 / 9,
      autoPlay: false,
      looping: false,
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Cached Network Image
        CachedNetworkImage(
          imageUrl: widget.imageUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        SizedBox(height: 10),
        // Video Player
        Chewie(controller: _chewieController),
      ],
    );
  }
}
