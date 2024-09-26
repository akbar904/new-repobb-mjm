
import 'package:flutter/material.dart';
import 'package:simple_pet_app/models/pet_model.dart';

class PetWidget extends StatelessWidget {
	final Pet pet;

	const PetWidget({Key? key, required this.pet}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Column(
			mainAxisAlignment: MainAxisAlignment.center,
			children: [
				Text(pet.name, style: TextStyle(fontSize: 24)),
				Icon(pet.icon, size: 48),
			],
		);
	}
}
