
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.simple_pet_app/main.dart';

void main() {
	group('Main App Tests', () {
		testWidgets('App starts and displays HomeScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());
			
			// Verify that HomeScreen is displayed
			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});
}
