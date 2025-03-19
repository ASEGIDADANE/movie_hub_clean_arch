
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/common/widget/tv/tv_card.dart';

import 'package:movie_app/presentation/home/bloc/popular_tv_cubit.dart';
import 'package:movie_app/presentation/home/bloc/popular_tv_state.dart';


class PopularTvMovies extends StatelessWidget {
  const PopularTvMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTvCubit()..getPopularTvMovies(),
      child: BlocBuilder<PopularTvCubit, PopularTvState>(
        builder: (context, state) {
          if (state is PopularTvloadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PopularTvLoadedState) {
             return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return TVCard(
                    tvEntity: state.tv[index], 
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10,),
                itemCount: state.tv.length
              ),
            );
          }

          if (state is failureState) {
            return Center(child: Text(state.message));
          }

          return Container();
        },
      ),
    );
  }
}
