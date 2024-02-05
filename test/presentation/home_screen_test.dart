import 'package:auto_ch_tech_assesment/core/app_export.dart';
import 'package:auto_ch_tech_assesment/data/model/all_car_model.dart';
import 'package:auto_ch_tech_assesment/presentation/home_screen.dart';
import 'package:auto_ch_tech_assesment/widgets/carousel.dart';
import 'package:auto_ch_tech_assesment/widgets/custom_bottom_bar.dart';
import 'package:auto_ch_tech_assesment/widgets/custom_image_view.dart';
import 'package:auto_ch_tech_assesment/widgets/custom_search_view.dart';
import 'package:auto_ch_tech_assesment/widgets/product_card_carousel.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:auto_ch_tech_assesment/presentation/bloc/all_cars/all_car_bloc.dart';
import 'package:auto_ch_tech_assesment/presentation/bloc/popular_car_makes/popular_car_make_bloc.dart';

class MockAllCarBloc extends MockBloc<AllCarEvent, AllCarState>
    implements AllCarBloc {}

class MockPopularCarMakeBloc
    extends MockBloc<PopularCarMakeEvent, PopularCarMakeState>
    implements PopularCarMakeBloc {}

void main() {
  late MockAllCarBloc mockAllCarBloc;
  late MockPopularCarMakeBloc mockPopularCarMakeBloc;

  setUp(() {
    mockAllCarBloc = MockAllCarBloc();
    mockPopularCarMakeBloc = MockPopularCarMakeBloc();
  });

  Widget buildTestableWidget(Widget widget) {
    return MaterialApp(
      home: widget,
    );
  }

  testWidgets('HomeScreen renders correctly', (WidgetTester tester) async {
    // Arrange
    // when(() => mockAllCarBloc.state)
    //     .thenReturn(AllCarLoaded(carList: [Result()]));
    when(() => mockPopularCarMakeBloc.state)
        .thenReturn(PopularCarMakeLoaded(makeList: [MakeList()]));

    // Act
    await tester.pumpWidget(
      buildTestableWidget(
        HomeScreen(),
      ),
    );

    // Assert
    expect(find.text('Explore'), findsNWidgets(2));
    expect(find.byType(CustomSearchField), findsOneWidget);
    expect(find.byType(CustomBottomBar), findsOneWidget);
    // Add more assertions based on your UI components
  });
}
