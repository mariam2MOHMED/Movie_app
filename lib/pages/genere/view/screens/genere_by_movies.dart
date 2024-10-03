import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/pages/genere/Bloc/genere_bloc.dart';
import 'package:movie_app/pages/home_screen/view/widgets/book_mark.dart';
import 'package:movie_app/pages/watch_list/view/widget/watch_item.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../shared/services/services_locator.dart';
import '../../../movie_Detials/view/screens/movie_details_screen.dart';

class GenerByMovies extends StatelessWidget {
  String name;
  int id;
   GenerByMovies({
    required this.id,
     required this.name,
   });

  @override
  Widget build(BuildContext context) {
       return BlocProvider(
  create: (context) => sl<GenereBloc>()..add(GetGenereByMoviesEvent
    (id, name)),
  child: BlocBuilder<GenereBloc, GenereState>(
  builder: (context, state) {
    final movie=state.genere;
    return Scaffold(
      appBar: AppBar(
        title: Text('$name Movies',
            style: GoogleFonts.abhayaLibre(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp, color: Colors.white)),
      ),
      body:
      ListView.builder(
        itemCount:state.genere.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Stack(
              alignment: Alignment.topLeft,
              children: [
                CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width*0.35,
                  height: MediaQuery.of(context).size.height*0.3,

                  imageUrl:
                  'https://image.tmdb.org/t/p/w500${movie[index].backDropPath}',
                  placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Icon(Icons.menu_rounded,
                        size: 40,color: Colors.grey,)

                  ),
                  errorWidget: (context, url, error) => Icon(
                      Icons.image_not_supported_rounded),
                  fadeInDuration: Duration(milliseconds: 500),
                  fadeOutDuration: Duration(milliseconds: 500),
                ),
                // bookMark()
              ],
            ),
            title: Text(
              "${movie[index].title}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  color: Colors.white),
            ),
            subtitle: Text(
              '${movie[index].releaseDate}',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MovieDetailsScreen(
                    id: movie[index].id,
                  ),

              ));
            },
          );
        },
      ),
    );
  },
),
);;
  }
}
