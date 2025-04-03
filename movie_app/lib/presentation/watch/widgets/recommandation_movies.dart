import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/common/widget/movie/movie_card.dart';

import 'package:movie_app/presentation/watch/bloc/recommandation_cubit.dart';
import 'package:movie_app/presentation/watch/bloc/recommandation_state.dart';



class RecommendationMovies extends StatelessWidget {
  final int movieId;
  const RecommendationMovies({required this.movieId,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecommandationCubit()..getRecommandationMovies(movieId),
      child: BlocBuilder<RecommandationCubit,RecommandationState>(
        builder: (context, state) {
          if (state is RecommandationLoadingState){
            return const Center(
              child: CircularProgressIndicator()
            );
          }
          
          if (state is RecommandationLoadedState ){
         
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recommendation',
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
                        movieEntity: state.recommandationList[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 10,),
                    itemCount: state.recommandationList.length
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