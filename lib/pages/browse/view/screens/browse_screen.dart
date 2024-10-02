import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/pages/browse/bloc/browse_bloc.dart';

import '../../../../shared/services/services_locator.dart';
import '../../../../shared/theme/theme.dart';
import '../../../genere/view/screens/genere_by_movies.dart';

class BrowseScreen extends StatelessWidget {
   BrowseScreen({super.key});
  List<String>browseImages=[
    'assets/action.png',
    'assets/adventure.png',
    'assets/animation.png',
    'assets/comedy.png',
    'assets/crime.png',
    'assets/documentary.png',
    'assets/drama.png',
    'assets/family.png',
    'assets/fantasy.png',
    'assets/history.png',
    'assets/horror.png',
    'assets/music.jpg',
    'assets/mystery.png',
    'assets/remonatic.jpg',
    'assets/science fiction.png',
    'assets/tv movie.png',
    'assets/thriller.png',
    'assets/war.png',
    'assets/western.png'
  ];
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
  create: (context) => sl<BrowseBloc>()..add(GetBrowseEvent()),
  child: BlocBuilder<BrowseBloc, BrowseState>(
  builder: (context, state) {
    final movie=state.browse;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50.h,),
          Text(
            'Browse Screen',
            style: GoogleFonts.abhayaLibre(
                fontWeight:
                FontWeight.bold, fontSize: 25,
                color: Colors.white),
          ),
          Expanded(
            child: GridView.builder(

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: state.browse.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>GenerByMovies(id: state.browse[index].id,
                          name: state.browse[index].title,
                        )));
                    },
                  child: GridTile(
                      child:Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset(browseImages[index],
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                            height:MediaQuery.of(context).size.height*0.2 ,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color:Colors.grey[700] ,
                            child: Text(

                          movie[index].title,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  color:AppTheme.white,

                                  fontSize:16.sp
                              ),),
                          )
                        ],
                      )
                    // Container(
                    //  decoration: BoxDecoration(
                    //
                    //    image: DecorationImage(
                    //        image:AssetImage(browseImages[index])
                    //       )
                    //  ),
                    //   padding: EdgeInsets.all(10),
                    //   child: Center(
                    //     child: Text(
                    //       genres[index]['name'],
                    //       style: TextStyle(color: Colors.white, fontSize: 18),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ),
                    // ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  },
),
);
  }
}
