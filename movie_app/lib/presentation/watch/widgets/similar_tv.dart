import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/common/widget/movie/movie_card.dart';


import 'package:movie_app/presentation/watch/bloc/similar_movies_state.dart';
import 'package:movie_app/presentation/watch/bloc/similar_tv_cubit.dart';



class SimilarTvs extends StatelessWidget {
  final int tvId;
  const SimilarTvs({required this.tvId,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarTvsCubit()..getSimilarTvs(tvId),
      child: BlocBuilder<SimilarTvsCubit,SimilarState>(
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