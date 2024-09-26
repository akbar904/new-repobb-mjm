
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lib/models/pet_model.dart';

void main() {
	group('Pet Model Tests', () {
		test('Pet model should be instantiated with correct name and icon', () {
			final pet = Pet(name: 'Cat', icon: Icons.pets);
			
			expect(pet.name, 'Cat');
			expect(pet.icon, Icons.pets);
		});

		test('Pet model should support equality comparison', () {
			final pet1 = Pet(name: 'Dog', icon: Icons.person);
			final pet2 = Pet(name: 'Dog', icon: Icons.person);
			final pet3 = Pet(name: 'Cat', icon: Icons.pets);
			
			expect(pet1, equals(pet2));
			expect(pet1, isNot(equals(pet3)));
		});

		test('Pet model should have correct hash code based on properties', () {
			final pet = Pet(name: 'Dog', icon: Icons.person);
			final expectedHashCode = pet.name.hashCode ^ pet.icon.hashCode;
			
			expect(pet.hashCode, expectedHashCode);
		});
	});
}
