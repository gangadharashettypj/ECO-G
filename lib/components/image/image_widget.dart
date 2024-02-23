/*
 * @Author GS
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_network/image_network.dart';
import 'package:lottie/lottie.dart';

enum ImageType { asset, network }

class ImageWidget extends StatelessWidget {
  final bool isSvg;
  final double? height;
  final double? width;
  final BoxFit boxFit;
  final ImageType imageType;
  final String imageLocation;
  final Color? color;
  final PlaceholderWidgetBuilder? placeholderWidgetBuilder;
  final LoadingErrorWidgetBuilder? errorWidgetBuilder;

  ImageWidget({
    super.key,
    required this.imageLocation,
    this.boxFit = BoxFit.contain,
    this.height,
    this.width,
    this.color,
    this.placeholderWidgetBuilder,
    this.errorWidgetBuilder,
  })  : imageType = imageLocation.trim().startsWith('assets/')
            ? ImageType.asset
            : ImageType.network,
        isSvg = imageLocation.trim().startsWith('assets/')
            ? imageLocation.endsWith('.svg')
            : Uri.parse(imageLocation).path.endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    if (isSvg) {
      switch (imageType) {
        case ImageType.asset:
          return SvgPicture.asset(
            imageLocation,
            height: height,
            width: width,
            fit: boxFit,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
          );
        case ImageType.network:
          return SvgPicture.network(
            imageLocation,
            height: height,
            width: width,
            fit: boxFit,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
          );
      }
    } else {
      switch (imageType) {
        case ImageType.asset:
          return Image.asset(
            imageLocation,
            height: height,
            width: width,
            fit: boxFit,
            color: color,
          );

        case ImageType.network:
          if (kIsWeb) {
            return SizedBox(
              width: width ?? 30,
              height: height ?? 30,
              child: ImageNetwork(
                image: imageLocation,
                imageCache: CachedNetworkImageProvider(imageLocation),
                width: width ?? 30,
                height: height ?? 30,
                duration: 500,
                curve: Curves.easeIn,
                onPointer: true,
                debugPrint: false,
                fullScreen: false,
                fitAndroidIos: boxFit,
                fitWeb: BoxFitWeb.contain,
                onLoading: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueGrey,
                  ),
                ),
                onError: Lottie.asset(
                  width: width ?? 30,
                  height: height ?? 30,
                  Assets.lottie.loader.path,
                ),
                onTap: () {
                  debugPrint("©gabriel_patrick_souza");
                },
              ),
            );
          }
          return CachedNetworkImage(
            width: width,
            height: height,
            imageUrl: imageLocation,
            fit: boxFit,
            color: color,
            placeholder: placeholderWidgetBuilder ??
                (_, __) => SizedBox(
                      height: height,
                      width: width,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
            errorWidget: errorWidgetBuilder ??
                (_, __, ___) => Lottie.asset(
                      height: height,
                      width: width,
                      Assets.lottie.loader.path,
                    ),
          );
      }
    }
  }
}
