
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/watch/bloc/trailer_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../bloc/trailer_state.dart';

class VideoPlayer extends StatelessWidget {
  final int id;
  const VideoPlayer({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerCubit()..getMovieTrailer(id),
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          if (state is TrailerLoadingState) {
            
            return const Center(child: CircularProgressIndicator());
          }
         
          if (state is TrailerLoadedState) {

            
        
            return YoutubePlayer(
              
              controller: state.youtubePlayerController,
              showVideoProgressIndicator: true,

              
            );
          }
          if (state is FailureState ) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
