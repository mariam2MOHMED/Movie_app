import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/genere_list.dart';

class BrowseWidget extends StatelessWidget {
   BrowseWidget({super.key, required this.image,
     required this.genereList});
final String image;final GenereList genereList;
  @override
  Widget build(BuildContext context) {

    return  Stack(

      alignment: AlignmentDirectional.center,
      children: [
    ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Image.asset(image,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
        height:MediaQuery.of(context).size.height*0.15,
      ),
    ),
        Text(genereList.name,style:
        Theme.of(context).textTheme.headlineLarge!
            .copyWith(
         fontWeight: FontWeight.bold,fontSize: 20.sp
        ),)
      ],
    );
  }
}
