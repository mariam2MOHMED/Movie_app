import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/shared/theme/theme.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/models/watchList.dart';

class watchList extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Center();
    //   Column(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   children: [
    //     SizedBox(
    //       height: 50.h,
    //     ),
    //   Text('WatchList Screen',
    //   style: GoogleFonts.abhayaLibre(
    //     fontWeight: FontWeight.bold,
    //     fontSize: 25,
    //     color: AppTheme.white,
    //   ),),
    //     Expanded(
    //       child: ListView.builder(itemBuilder: (context,index){
    //         return     ListTile(
    //
    //           leading: CachedNetworkImage(imageUrl:
    //           'https://image.tmdb.org/t/p/w200${watchListItem.backDropPath}',
    //               fit: BoxFit.cover,
    //               width: MediaQuery.of(context).size.width*0.35,
    //               height:MediaQuery.of(context).size.width*0.2,
    //               placeholder: (context, url) =>
    //                   Shimmer.fromColors(
    //                       baseColor: Colors.grey[850]!,
    //                       highlightColor: Colors.grey[800]!,
    //                       child: Icon(Icons.menu_rounded,
    //                         size: 40,color: Colors.grey,)
    //                   )),
    //           title: Text( '${watchListItem.title}',
    //             style: TextStyle(
    //               fontSize: 20.sp,
    //               fontWeight: FontWeight.w600,
    //               color: Colors.white,
    //             ),),
    //           subtitle: Text('${watchListItem.releaseData}'
    //          ,maxLines: 2,
    //             overflow: TextOverflow.ellipsis,
    //             style: TextStyle(
    //               fontSize: 15,
    //               fontWeight: FontWeight.w300,
    //               color: Colors.white,
    //             ),
    //           ),
    //           onTap: () {
    //             //Navigator.of(context).push(
    //               // MaterialPageRoute(
    //               //   builder: (context) => MovieDetailsScreen(
    //               //     id: movie['id'],
    //               //   ),
    //               // ),
    //        //     );
    //           },
    //         );
    //       },itemCount:10,),
    //     )
    //   ],
    // );
  }
}
