
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:your_package_name/cubit/pet_state.dart'; // Replace with the actual package name

// Mock the Pet class to use within the tests
class MockPet extends Mock implements Pet {}

void main() {
	group('PetState', () {
		// Test the initial state of PetState
		test('initial state is correct', () {
			final pet = MockPet();
			final petState = PetState(pet: pet);

			expect(petState.pet, pet);
		});

		// Test PetState equality
		test('supports value comparisons', () {
			final pet1 = MockPet();
			final pet2 = MockPet();

			expect(PetState(pet: pet1), PetState(pet: pet1));
			expect(PetState(pet: pet1), isNot(PetState(pet: pet2)));
		});

		// Test PetState serialization/deserialization
		test('can be serialized and deserialized', () {
			final pet = Pet(name: 'Cat', icon: Icons.pets);
			final petState = PetState(pet: pet);

			final json = petState.toJson();
			final deserializedPetState = PetState.fromJson(json);

			expect(deserializedPetState, petState);
		});
	});
}
