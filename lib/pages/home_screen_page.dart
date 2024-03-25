import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/categores_bloc/categories_bloc.dart';
import '../bloc/game/game_bloc.dart';
import '../bloc/them/ThemeCubit.dart';
import 'GameWidget.dart';

// Home page
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoriesLoaded) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    final category = state.categories[index];
                    final isSelected = state.selectedCategoryId == category.id;
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<CategoriesBloc>(context).add(
                          SelectCategory(
                              categoryId: category.id), // Pass categoryId
                        );

                        BlocProvider.of<ProductsBloc>(context)
                            .add(LoadProducts(category.id));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Chip(
                          label: Text(
                            category.name,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          backgroundColor:
                              isSelected ? Colors.blue : Colors.grey[300],
                        ),
                      ),
                    );
                  },
                ),
              ),
          /*    Expanded(
                child:  BlocBuilder<GameBloc, GameState>(
                  builder: (context, state) {
                    return Card(
                      elevation: 15,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              userInteractionBloc.add(GameEvent.startGame);
                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  color: Colors.white,
                                ),
                                AnimatedContainer(
                                  alignment: Alignment(0, state.ballBottomPosition),
                                  duration: const Duration(milliseconds: 50),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Score: ${state.score}',
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              userInteractionBloc.add(GameEvent.jump);
                            },
                            child: const Text('Jump'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )*/
              /*    Expanded(
                child: BlocBuilder<ProductsBloc, ProductsState>(
                  builder: (context, productState) {
                    if (productState is ProductsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (productState is ProductsLoaded) {
                      return ProductsGrid(productState.products);
                    } else if (productState is ProductsError) {
                      return const Center(
                        child: Text('Error loading products'),
                      );
                    } else {
                      return Container(); // Placeholder
                    }
                  },
                ),
              ),*/

           /*   Expanded(child: GameWidget(ballCount: 1,))*/
            ],
          );
        } else if (state is CategoriesError) {
          return const Center(
            child: Text('Error loading categories'),
          );
        } else {
          return Container(); // Placeholder
        }
      },
    );
  }
}
