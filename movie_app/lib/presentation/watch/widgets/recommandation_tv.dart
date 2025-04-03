import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:movie_app/common/widget/tv/tv_card.dart';


import 'package:movie_app/presentation/watch/bloc/recommandation_state.dart';
import 'package:movie_app/presentation/watch/bloc/recommandition_tv_cubit.dart';



class RecommandationTvs extends StatelessWidget {
  final int tvId;
  const RecommandationTvs({required this.tvId,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecommandationTvsCubit()..getRecommandationTvs(tvId),
      child: BlocBuilder<RecommandationTvsCubit,RecommandationState>(
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

                      return TVCard(
                        tvEntity: state.recommandationList[index],
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