import 'package:flutter/material.dart';

class IntroMenuButton extends StatefulWidget {
  const IntroMenuButton({required this.title, required this.icon, super.key});

  final String title;
  final Widget icon;

  @override
  State<IntroMenuButton> createState() => _IntroMenuButtonState();
}

class _IntroMenuButtonState extends State<IntroMenuButton> {
  bool beingHovered = false;
  void setHoveringState(bool newState) {
    setState(() {
      beingHovered = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setHoveringState(true),
      onExit: (event) => setHoveringState(false),
      child: Container(
        decoration:
            beingHovered
                ? BoxDecoration(
                  color: Color(0xFFcf8f14),
                  borderRadius: BorderRadius.circular(4),
                )
                : null,
        padding: EdgeInsetsDirectional.only(
          top: 6,
          bottom: 6,
          start: 10,
          end: 16,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                minHeight: 32,
                maxHeight: 32,
                minWidth: 32,
              ),

              // padding: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Align(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: widget.icon,
                ),
              ),
            ),
            SizedBox(width: 16),
            Transform.scale(
              alignment: Alignment.centerLeft,
              scaleX: .8,
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
