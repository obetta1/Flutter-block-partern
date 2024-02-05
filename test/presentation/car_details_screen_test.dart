import 'package:auto_ch_tech_assesment/data/model/car_details_model.dart';
import 'package:auto_ch_tech_assesment/presentation/car_details/car_detail_widgets.dart';
import 'package:auto_ch_tech_assesment/presentation/car_details/car_details_screen.dart';
import 'package:auto_ch_tech_assesment/presentation/car_details/car_spec_widget.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_ch_tech_assesment/presentation/bloc/car_details/car_details_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Mock your CarDetailsBloc if needed
class MockCarDetailsBloc extends MockBloc<CarDetailsEvent, CarDetailsState>
    implements CarDetailsBloc {}

void main() {
  group('CarDetailsScreen Widget Test', () {
    late MockCarDetailsBloc mockCarDetailsBloc;

    setUp(() {
      mockCarDetailsBloc = MockCarDetailsBloc();
    });

    testWidgets('Renders CarDetailsScreen correctly',
        (WidgetTester tester) async {
      when(mockCarDetailsBloc.state)
          .thenReturn(CarDetailsLoaded(carDetails: CarDetailsModel()));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockCarDetailsBloc,
            child: CarDetailsScreen(carId: 'R1nVTV4Mj'),
          ),
        ),
      );

      // Wait for widgets to be rendered
      await tester.pumpAndSettle();

      // Verify that the correct widgets are displayed
      expect(find.text('Explore'), findsOneWidget);
      expect(find.byType(CarDetailImageCard), findsOneWidget);
      expect(find.byType(CarSpecTile), findsOneWidget);
      expect(find.text('Error: Unknow state'),
          findsNothing); // Make sure error message is not displayed
    });

    testWidgets('Renders loading state correctly', (WidgetTester tester) async {
      whenListen(
        mockCarDetailsBloc,
        Stream.fromIterable([CarDetailsloading()]),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockCarDetailsBloc,
            child: CarDetailsScreen(carId: 'R1nVTV4Mj'),
          ),
        ),
      );

      // Wait for widgets to be rendered
      await tester.pumpAndSettle();

      // Verify that loading widget is displayed
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Renders error state correctly', (WidgetTester tester) async {
      whenListen(
        mockCarDetailsBloc,
        Stream.fromIterable([CarDetailsError(errorMessage: 'Test error')]),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockCarDetailsBloc,
            child: CarDetailsScreen(carId: 'R1nVTV4Mj'),
          ),
        ),
      );

      // Wait for widgets to be rendered
      await tester.pumpAndSettle();

      // Verify that error message is displayed
      expect(find.text('Error: Test error'), findsOneWidget);
    });
  });
}
