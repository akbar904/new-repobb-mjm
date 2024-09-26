
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/pet_cubit.dart';
import '../widgets/pet_widget.dart';

class HomeScreen extends StatelessWidget {
	const HomeScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Simple Pet App'),
			),
			body: Center(
				child: BlocBuilder<PetCubit, PetState>(
					builder: (context, state) {
						return GestureDetector(
							onTap: () => context.read<PetCubit>().togglePet(),
							child: PetWidget(pet: state.pet),
						);
					},
				),
			),
		);
	}
}
