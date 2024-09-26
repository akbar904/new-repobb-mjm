
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:simple_pet_app/widgets/pet_widget.dart';
import 'package:simple_pet_app/models/pet_model.dart';

void main() {
	group('PetWidget', () {
		testWidgets('displays the correct pet name and icon', (WidgetTester tester) async {
			// Arrange
			final pet = Pet(name: 'Cat', icon: Icons.access_time);

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: PetWidget(pet: pet),
					),
				),
			);

			// Assert
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays the correct pet name and icon when changed', (WidgetTester tester) async {
			// Arrange
			final pet = Pet(name: 'Dog', icon: Icons.person);

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: PetWidget(pet: pet),
					),
				),
			);

			// Assert
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
