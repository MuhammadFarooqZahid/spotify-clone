import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:spotify/common/widget/app_button.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spotify/core/config/theme/app_colors.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.linePatternTop),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.linePatternBottom),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBG),
          ),
          SafeArea(
              child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
              const Spacer(),
              SvgPicture.asset(AppVectors.logo),
              const Gap(40),
              Text(
                textAlign: TextAlign.center,
                AppLocalizations.of(context)!.introHeading,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                AppLocalizations.of(context)!.spotifyDescription,
                style: const TextStyle(
                  fontSize: 17,
                  color: Color(0xFFA0A0A0),
                ),
              ),
              Row(
                children: [
                  AppButton(
                    onTap: () {},
                    label: AppLocalizations.of(context)!.register,
                  )
                ],
              ),
              const Spacer(),
            ],
          ))
        ],
      ),
    );
  }
}
