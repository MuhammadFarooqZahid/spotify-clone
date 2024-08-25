import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spotify/presentation/choose_mode/page/choose_mode.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  void didChangeDependencies() {
    preloadImage(); // pre loading image for choose theme mode screen
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages.introBG,
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
                    AppLocalizations.of(context)!.introHeading,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    AppLocalizations.of(context)!.introSubheading,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Gap(20),
                  FilledButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) {
                            return const ChooseModePage();
                          },
                        ),
                      );
                    },
                    child: Text(AppLocalizations.of(context)!.getStarted),
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

  Future<void> preloadImage() async {
    await precacheImage(const AssetImage(AppImages.chooseModeBG), context);
  }
}
