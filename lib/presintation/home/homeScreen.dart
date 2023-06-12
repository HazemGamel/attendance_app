import 'package:attendance/app/Resource/Appcolors.dart';
import 'package:attendance/presintation/home/cubit/Homecubit.dart';
import 'package:attendance/presintation/home/cubit/homeStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeStates>(
        builder: (context,stat){
          return Scaffold(
            body: HomeCubit.get(context).pages[
              HomeCubit.get(context).currentindex
            ],
            bottomNavigationBar: GNav(
                selectedIndex: HomeCubit.get(context).currentindex,
                onTabChange: (i){
                  HomeCubit.get(context).changePage(i);
                },
                backgroundColor: AppColors.bottomnavcolor,
                color: Colors.white,
                activeColor: Colors.green[500],
                // tab button hover color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // navigation bar padding
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.menu,
                    text: 'subjects',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'setting',
                  ),
                ]
            ),
          );
        });
  }
}
