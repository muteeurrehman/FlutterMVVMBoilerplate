import 'package:flutter/material.dart';
import 'package:flutter_app_starter/components/app_bar.dart';

import 'package:flutter_app_starter/mvvm/view.abs.dart';
import 'package:flutter_app_starter/screens/bird_detais/bird_details_vm.dart';
import 'package:provider/provider.dart';

class BirdDetails extends Screen<BirdDetailsVM> {
  const BirdDetails(super.viewModel, {super.key});

  @override
  Widget createWidget(BuildContext context) {
    return ChangeNotifierProvider<BirdDetailsVM>.value(
        value: viewModel,
        child: Consumer<BirdDetailsVM>(
            builder: (context, viewModel, child) => Scaffold(
                  appBar: CustomAppBar(
                    title: const Text('Bird Details'),
                  ),
                  body: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display bird image
                        Image.network(
                          viewModel.bird.image,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 16.0),
                        // Display bird name
                        Text(
                          viewModel.bird.name,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        // Display bird species
                        Text(
                          viewModel.bird.species,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Display bird details
                        Text(
                          'Family: ${viewModel.bird.family}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Habitat: ${viewModel.bird.habitat}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Place of Found: ${viewModel.bird.placeOfFound}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Diet: ${viewModel.bird.diet}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Description: ${viewModel.bird.description}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
