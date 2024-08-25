import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/presentation/auth/pages/signup_or_signin.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages.chooseModeBG,
            fit: BoxFit.cover,
          ),
          ColoredBox(
            color: const Color(0xFFDADADA).withOpacity(0.05),
            child: const SizedBox(
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppVectors.logo,
                    height: 40,
                  ),
                  const Spacer(),
                  Text(
                    textAlign: TextAlign.center,
                    AppLocalizations.of(context)!.chooseMode,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildBluredIcon(
                        context,
                        icon: SvgPicture.asset(
                          AppVectors.moon,
                          fit: BoxFit.none,
                        ),
                        label: AppLocalizations.of(context)!.darkMode,
                        onTap: () {
                          context.read<ThemeCubit>().updateTheme(
                              ThemeMode.dark); // setting theme mode to dark
                        },
                      ),
                      _buildBluredIcon(
                        context,
                        icon: SvgPicture.asset(
                          AppVectors.sun,
                          fit: BoxFit.none,
                        ),
                        label: AppLocalizations.of(context)!.lightMode,
                        onTap: () {
                          context.read<ThemeCubit>().updateTheme(
                              ThemeMode.light); // setting theme mode to light
                        },
                      ),
                    ],
                  ),
                  const Gap(30),
                  FilledButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const SignupOrSigninPage(),
                        ),
                      );
                    },
                    child: Text(AppLocalizations.of(context)!.continuebtn),
                  ),
                  const Gap(10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildBluredIcon(
    BuildContext context, {
    required Widget icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
                child: icon,
              ),
            ),
          ),
        ),
        const Gap(5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
