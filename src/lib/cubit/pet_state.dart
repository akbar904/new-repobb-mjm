
import 'package:flutter/material.dart';
import '../models/pet_model.dart';

class PetState {
	final Pet pet;

	PetState({required this.pet});

	Map<String, dynamic> toJson() {
		return {
			'pet': pet.toJson(),
		};
	}

	static PetState fromJson(Map<String, dynamic> json) {
		return PetState(
			pet: Pet.fromJson(json['pet']),
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(this, other)) return true;
		if (runtimeType != other.runtimeType) return false;
		final PetState otherState = other as PetState;
		return pet == otherState.pet;
	}

	@override
	int get hashCode => pet.hashCode;
}
