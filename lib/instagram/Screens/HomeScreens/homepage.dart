import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram/instagram/widgets/post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: SizedBox(
            width: 105.w,
            height: 28.h,
            child: Image.asset(
              'assets/images/instagram.jpg',
            )),
        leading: Image.asset('assets/images/camera.jpg'),
        actions: [
          Icon(
            Icons.favorite_outline_sharp,
            color: Colors.black,
            size: 25,
          ),
          Image.asset(
            'assets/images/send.png',
            height: 32.h,
            width: 24.w,
          )
        ],
        backgroundColor: const Color(0xffFAFAFA),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PostWidget();
              },
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
