import 'package:flutter/material.dart';
import 'package:flutter_app_starter/business_logic/model/bird.dart';
import 'package:flutter_app_starter/components/app_bar.dart';
import 'package:flutter_app_starter/mvvm/view.abs.dart';
import 'package:flutter_app_starter/screens/birds_list/birds_list_vm.dart';
import 'package:provider/provider.dart';

class BirdsList extends Screen<BirdsListVM> {
  const BirdsList(super.viewModel, {super.key});

  @override
  Widget createWidget(BuildContext context) {
    return ChangeNotifierProvider<BirdsListVM>.value(
        value: viewModel,
        child: Consumer<BirdsListVM>(
            builder: (context, viewModel, child) => Scaffold(
                  appBar: CustomAppBar(
                    title: const Text('Bird List'),
                  ),
                  body: ListView.builder(
                    itemCount: viewModel.birds.length,
                    itemBuilder: (context, index) {
                      // Get the bird at the current index
                      Bird bird = viewModel.birds[index];
                      return ListTile(
                        leading: CircleAvatar(
                          // Display bird image if available, else display a placeholder
                          backgroundImage: NetworkImage(bird.image),
                        ),
                        title: Text(bird.name),
                        subtitle: Text(bird.species),
                        onTap: () {
                          viewModel.onBirdSelected(index);
                        },
                      );
                    },
                  ),
                )));
  }
}
