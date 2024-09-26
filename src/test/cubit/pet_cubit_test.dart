
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_pet_app/cubit/pet_cubit.dart';
import 'package:simple_pet_app/cubit/pet_state.dart';
import 'package:simple_pet_app/models/pet_model.dart';

class MockPetCubit extends MockCubit<PetState> implements PetCubit {}

void main() {
	group('PetCubit', () {
		late PetCubit petCubit;

		setUp(() {
			petCubit = PetCubit();
		});

		tearDown(() {
			petCubit.close();
		});

		test('initial state is PetState with Cat', () {
			expect(petCubit.state, PetState(pet: Pet(name: 'Cat', icon: Icons.pets)));
		});

		blocTest<PetCubit, PetState>(
			'emits [PetState] with Dog when togglePet is called from initial Cat state',
			build: () => petCubit,
			act: (cubit) => cubit.togglePet(),
			expect: () => [PetState(pet: Pet(name: 'Dog', icon: Icons.person))],
		);

		blocTest<PetCubit, PetState>(
			'emits [PetState] with Cat when togglePet is called from Dog state',
			build: () {
				petCubit.emit(PetState(pet: Pet(name: 'Dog', icon: Icons.person)));
				return petCubit;
			},
			act: (cubit) => cubit.togglePet(),
			expect: () => [PetState(pet: Pet(name: 'Cat', icon: Icons.pets))],
		);
	});
}
