
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'pet_state.dart';
import 'package:simple_pet_app/models/pet_model.dart';

class PetCubit extends Cubit<PetState> {
	PetCubit() : super(PetState(pet: Pet(name: 'Cat', icon: Icons.pets)));

	void togglePet() {
		if (state.pet.name == 'Cat') {
			emit(PetState(pet: Pet(name: 'Dog', icon: Icons.person)));
		} else {
			emit(PetState(pet: Pet(name: 'Cat', icon: Icons.pets)));
		}
	}
}
