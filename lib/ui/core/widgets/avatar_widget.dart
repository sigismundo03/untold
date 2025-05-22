import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.assetName,
    required this.text,
    this.onPressed,
    required this.subtext,
    this.isEdit = false,
    this.image,
  });
  final String assetName;
  final Widget text;
  final void Function()? onPressed;

  final Widget subtext;
  final bool isEdit;

  final File? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CacheImageWidget(assetName: assetName,
            height: 110.0 ,
            width: 110.0,),
           
            if (isEdit)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(87, 79, 62, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: onPressed,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SvgPicture.asset(
                          'assets/camera.svg',
                          height: 24,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        Expanded(
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text,
              subtext,
            ],
          ),
        ),
      ],
    );
  }
}

class CacheImageWidget extends StatelessWidget {
  const CacheImageWidget({
    super.key,
    required this.assetName,
    this.width,
    this.height,
  });

  final String assetName;
  final double? width;
  final double? height;


  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          assetName,
      imageBuilder: (context, imageProvider) => Container(
        width:width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
