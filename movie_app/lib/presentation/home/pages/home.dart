import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/common/widget/appbar/appbar.dart';
import 'package:movie_app/core/config/assets/app_vectors.dart';
import 'package:movie_app/presentation/home/widget/now_playing_movies.dart';
import 'package:movie_app/presentation/home/widget/trendingMovies.dart';
import 'package:movie_app/presentation/home/widget/categorical_text.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        action: IconButton(
          icon: const Icon(Icons.search),
          onPressed: (){
            // AppNavigator.push(context, const SearchPage());
          },
        ),
        title: SvgPicture.asset(
           AppVectors.logo
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: 'Trendings 🔥'),
            TrendingMovies(),
            SizedBox(height: 16,),
            CategoryText(title: 'Now Playing'),
            SizedBox(height: 16,),
            NowPlayingMovies(),
            SizedBox(height: 16,),
            CategoryText(title: 'Popular TV'),
            // SizedBox(height: 16,),
            // PopularTv(),
            // SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}