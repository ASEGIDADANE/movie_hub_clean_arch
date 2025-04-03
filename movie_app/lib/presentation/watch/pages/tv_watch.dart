import 'package:flutter/material.dart';
import 'package:movie_app/common/widget/appbar/appbar.dart';

import 'package:movie_app/domain/tv/entities/tv_entities.dart';

import 'package:movie_app/presentation/watch/widgets/recommandation_tv.dart';
import 'package:movie_app/presentation/watch/widgets/similar_movies.dart';


import 'package:movie_app/presentation/watch/widgets/video_overview.dart';
import 'package:movie_app/presentation/watch/widgets/video_player.dart';
import 'package:movie_app/presentation/watch/widgets/video_titile.dart';
import 'package:movie_app/presentation/watch/widgets/video_vote_average.dart';


class TvWatchPage extends StatelessWidget {
  final TVEntity tvEntity;
 
  const TvWatchPage({required this.tvEntity,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: tvEntity.id!),
            const SizedBox(height: 16,),
            VideoTitle(title: tvEntity.name!,),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                VideoVoteAverage(voteAverage: tvEntity.voteAverage!,)
              ],
            ),
            const SizedBox(height: 16,),
            VideoOverview(overview: tvEntity.overview!,),
            const SizedBox(height: 16,),
            RecommandationTvs(tvId: tvEntity.id!,),
            const SizedBox(height: 16,),
            SimilarMovies(movieId: tvEntity.id!,)
          ],
        ),
      ),
    );
  }
}