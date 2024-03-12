import 'package:auto_route/auto_route.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/components/image/image_widget.dart';
import 'package:flutter_game/gen/assets.gen.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/routes/app_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_card/paper_card.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 500), () {
        context.replaceRoute(const HomeRoute());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      backgroundColor: ColorName.copperGold.withOpacity(0.4),
      borderColor: ColorName.copperGold,
      borderThickness: 15,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.only(top: 24),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageWidget(
                imageLocation: Assets.images.logo.path,
                width: 100,
              ),
              const Gap.h16(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ECO - ',
                    style: GoogleFonts.rubikGlitchPop().copyWith(
                      color: ColorName.copperGold,
                      fontSize: 50,
                    ),
                  ),
                  Text(
                    'G',
                    style: GoogleFonts.rubikGlitch().copyWith(
                      color: Colors.green,
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
