import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spotify/Constants.dart';
import 'package:spotify/models/playlist_model.dart';
import 'package:spotify/models/song_model.dart';
import 'package:spotify/widgets/SongController.dart';
import 'package:spotify/widgets/Slider.dart';

class SongDetailScreen extends StatelessWidget {
  SongDetailScreen(
      {Key key,
      @required this.playlist,
      @required this.data,
      @required this.issheet})
      : super(key: key);
  final Playlist playlist;
  final Song data;
  final bool issheet;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.0, 0.8),
              colors: [
                const Color.fromRGBO(181, 220, 227, 0.6),
                const Color.fromRGBO(181, 220, 227, 0),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SongDetailHeader(
                title: playlist.title,
                isSheet: issheet,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: kSpacingUnit * 1),
                      SongDetailCoverImage(data: data),
                      SizedBox(height: kSpacingUnit * 1),
                      SongDetailControls(data: data),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SongDetailHeader extends StatelessWidget {
  SongDetailHeader({Key key, this.title, @required this.isSheet})
      : super(key: key);
  final String title;
  final bool isSheet;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kSpacingUnit * 2),
      child: Row(
        children: [
          GestureDetector(
            onTap: isSheet ? () {} : () => Navigator.of(context).pop(),
            child: SvgPicture.asset(
              'assets/icons/down_chevron.svg',
              height: 10.sp,
              width: 10.sp,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  'PLAYING FROM PLAYLIST',
                  style: kCaptionTextStyle.copyWith(
                    color: kTextColor,
                  ),
                ),
                Text(
                  title,
                  style: kBodyTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => Get.bottomSheet(
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment(0.0, -0.5),
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                  ),
                ),
                height: kSpacingUnit * 60,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: kSpacingUnit * 20,
                      height: kSpacingUnit * 20,
                      color: Color(0xff222327),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/Union 1.svg',
                          height: 80,
                          width: 80,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/heart.svg',
                                height: 20,
                                width: 20,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Like',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/minus_circle.svg',
                                height: 20,
                                width: 20,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Hide this song',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/Add music Icon.svg',
                                height: 20,
                                width: 20,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Add to Playlist',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/Music man.svg',
                                height: 20,
                                width: 20,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'View Artist',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/share.svg',
                                height: 20,
                                width: 20,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Share',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/Flag Icon.svg',
                                height: 20,
                                width: 20,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Report Explicit Content',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              elevation: 0.0,
              barrierColor: Colors.transparent,
              enableDrag: true,
              isScrollControlled: true,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: SvgPicture.asset(
                'assets/icons/actions.svg',
                height: 20.sp,
                width: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SongDetailCoverImage extends StatelessWidget {
  SongDetailCoverImage({Key key, @required this.data}) : super(key: key);
  final Song data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit * 3,
      ),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Image(
          image: AssetImage(data.image),
          fit: BoxFit.contain, // use this
        ),
      ),
    );
  }
}

class SongDetailControls extends StatelessWidget {
  SongDetailControls({Key key, this.data}) : super(key: key);
  final Song data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kSpacingUnit * 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.title,
            style: kSubTitleTextStyle,
          ),
          Text(
            data.artists.map((a) => a.name).join(', '),
            style: kBodyTextStyle.copyWith(
              color: kSecondaryTextColor,
            ),
          ),
          SizedBox(height: kSpacingUnit * 2),
          SpSlider(value: 30),
          SizedBox(height: kSpacingUnit * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/icons/heart.svg',
                height: 18.sp,
                width: 18.sp,
              ),
              Expanded(
                child: SongController(),
              ),
              SvgPicture.asset(
                'assets/icons/minus_circle.svg',
                height: 20.sp,
                width: 20.sp,
              ),
            ],
          ),
          SizedBox(height: kSpacingUnit * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/icons/devices.svg',
                height: 18.sp,
                width: 18.sp,
                color: kSecondaryTextColor,
              ),
              SvgPicture.asset(
                'assets/icons/share.svg',
                height: 18.sp,
                width: 18.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
