
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_pet_app/screens/home_screen.dart';

class MockPetCubit extends MockCubit<PetState> implements PetCubit {}
class FakePetState extends Fake implements PetState {}

void main() {
	group('HomeScreen Widget Tests', () {
		late PetCubit mockPetCubit;

		setUp(() {
			mockPetCubit = MockPetCubit();
			registerFallbackValue(FakePetState());
		});

		testWidgets('Displays Cat with clock icon initially', (WidgetTester tester) async {
			when(() => mockPetCubit.state).thenReturn(PetState(Pet(name: 'Cat', icon: Icons.access_time)));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<PetCubit>(
						create: (_) => mockPetCubit,
						child: const HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('Displays Dog with person icon after toggle', (WidgetTester tester) async {
			when(() => mockPetCubit.state).thenReturn(PetState(Pet(name: 'Cat', icon: Icons.access_time)));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<PetCubit>(
						create: (_) => mockPetCubit,
						child: const HomeScreen(),
					),
				),
			);

			whenListen(
				mockPetCubit,
				Stream.fromIterable([
					PetState(Pet(name: 'Dog', icon: Icons.person)),
				]),
			);

			await tester.tap(find.text('Cat'));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
