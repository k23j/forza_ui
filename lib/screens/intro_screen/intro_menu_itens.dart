import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forza_ui/debug/debug_border.dart';
import 'package:forza_ui/screens/intro_screen/intro_menu_button.dart';
import 'package:forza_ui/widgets/fade_widget.dart';
import 'package:forza_ui/widgets/forza_circular_progress_indicator.dart';

class IntroMenuItens extends StatelessWidget {
  const IntroMenuItens({required this.isLoaded, super.key});

  final bool isLoaded;

  final int fadeDelayInitial = 700;

  final int fadeDelayInterval = 150;

  @override
  Widget build(BuildContext context) {
    final Offset offset = Offset(200, 0);
    final Duration duration = Duration(milliseconds: 300);
    //Milliseconds
    // final int initialDelay = 700;
    final int delay = 300;

    final Widget logo = SvgPicture.asset(
      'assets/forza-motorsport-logo.svg',
      color: Colors.white,
      fit: BoxFit.fitWidth,
      // width: MediaQuery.of(context).size.width * .16,
    );

    // List<Widget> menuItems = [
    //   // _logo,
    //   Padding(
    //     padding: const EdgeInsets.only(top: 48.0, bottom: 24),
    //     child: IntroMenuButton(
    //       icon: Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 4.0),
    //         child: SvgPicture.asset(
    //           'assets/Return-left-02.svg',
    //           width: 36,
    //           // fit: BoxFit.fitWidth,
    //           color: Colors.white,
    //         ),
    //       ),
    //       title: 'PLAY',
    //     ),
    //   ),
    //   IntroMenuButton(
    //     icon: Text(
    //       'F',
    //       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
    //         fontWeight: FontWeight.bold,
    //         height: 1,
    //       ),
    //     ),
    //     title: 'ACCESSIBILITY/SETTINGS',
    //   ),
    // ];

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: FadeWidget(
            duration: duration,
            key: ValueKey(isLoaded),
            offset: offset,
            state: isLoaded ? FadeAnimState.play : FadeAnimState.done,
            child: DebugBorder(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox.expand(child: logo),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child:
              !isLoaded
                  ? ForzaCircularProgressIndicator(size: 72)
                  : FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: DebugBorder(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FadeWidget(
                              duration: duration,
                              offset: offset,
                              delay: Duration(milliseconds: delay * 1),
                              child: IntroMenuButton(
                                icon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/Return-left-02.svg',
                                    width: 36,
                                    // fit: BoxFit.fitWidth,
                                    color: Colors.white,
                                  ),
                                ),
                                title: 'PLAY',
                              ),
                            ),
                            SizedBox(height: 16),
                            FadeWidget(
                              duration: duration,
                              offset: offset,
                              delay: Duration(milliseconds: delay * 2),
                              child: IntroMenuButton(
                                icon: Text(
                                  'F',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    height: 1,
                                  ),
                                ),
                                title: 'ACCESSIBILITY/SETTINGS',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
        ),
      ],
      // isLoaded
      //     ? menuItems
      //         .mapIndexed(
      //           (index, widget) => FadeWidget(
      //             key: ValueKey<int>(index),
      //             delay: Duration(
      //               milliseconds:
      //                   (fadeDelayInterval * index) + fadeDelayInitial,
      //             ),
      //             offset: Offset(200, 0),
      //             duration: Duration(milliseconds: 300),
      //             child: widget,
      //           ),
      //         )
      //         .toList()
      //     //While Loading
      //     : [_logo, ForzaCircularProgressIndicator()],
    );
  }
}
