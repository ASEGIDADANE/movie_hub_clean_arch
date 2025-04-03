import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/common/widget/movie/movie_card.dart';

import 'package:movie_app/presentation/watch/bloc/similar_movies_cubit.dart';
import 'package:movie_app/presentation/watch/bloc/similar_movies_state.dart';



class SimilarMovies extends StatelessWidget {
  final int movieId;
  const SimilarMovies({required this.movieId,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarCubit()..getSimilarMovies(movieId),
      child: BlocBuilder<SimilarCubit,SimilarState>(
        builder: (context, state) {
          if (state is SimilarLoadingState){
            return const Center(
              child: CircularProgressIndicator()
            );
          }
          
          if (state is SimilarLoadedState ){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Similar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieCard(
                        movieEntity: state.SimilarList[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 10,),
                    itemCount: state.SimilarList.length
                  ),
                ),
              ],
            );
          }

          if (state is FaliureState) {
            return Text(state.message);
          }

          return Container();
        },
      )
    );
  }
}