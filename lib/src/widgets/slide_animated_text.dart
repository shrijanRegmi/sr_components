import 'package:flutter/material.dart';
import 'package:sr_components/sr_components.dart';

enum _Type {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headLineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

class SlideAnimatedText extends StatefulWidget {
  /// Displays a text with style of displayLarge which when hovered animates.
  const SlideAnimatedText.displayLarge(
    this.value, {
    super.key,
    this.style,
    this.styleOnHover,
    this.onPressed,
  }) : type = _Type.displayLarge;

  /// Displays a text with style of displayMedium which when hovered animates.
  const SlideAnimatedText.displayMedium(
    this.value, {
    super.key,
    this.style,
    this.styleOnHover,
    this.onPressed,
  }) : type = _Type.displayMedium;

  /// Displays a text with style of displaySmall which when hovered animates.
  const SlideAnimatedText.displaySmall(
    this.value, {
    super.key,
    this.style,
    this.styleOnHover,
    this.onPressed,
  }) : type = _Type.displaySmall;

  /// Displays a text with style of headlineLarge which when hovered animates.
  const SlideAnimatedText.headlineLarge(
    this.value, {
    super.key,
    this.style,
    this.styleOnHover,
    this.onPressed,
  }) : type = _Type.headlineLarge;

  /// Displays a text with style of headlineMedium which when hovered animates.
  const SlideAnimatedText.headlineMedium(
    this.value, {
    super.key,
    this.style,
    this.styleOnHover,
    this.onPressed,
  }) : type = _Type.headlineMedium;

  /// Displays a text with style of headLineSmall which when hovered animates.
  const SlideAnimatedText.headLineSmall(
    this.value, {
    super.key,
    this.style,
    this.styleOnHover,
    this.onPressed,
  }) : type = _Type.headLineSmall;

  /// Displays a text with style of titleLarge which when hovered animates.
  const SlideAnimatedText.titleLarge(
    this.value, {
    super.key,
    this.style,
    this.styleOnHover,
    this.onPressed,
  }) : type = _Type.titleLarge;

  /// Displays a text with style of titleMedium which when hovered animates.
  const SlideAnimatedText.titleMedium(
    this.value, {
    super.key,
    this.style,
    this.styleOnHover,
    this.onPressed,
  }) : type = _Type.titleMedium;

  /// Displays a text with style of titleSmall which when hovered animates.
  const SlideAnimatedText.titleSmall(
    this.value, {
    super.key,
    this.style,
    this.styleOnHover,
    this.onPressed,
  }) : type = _Type.titleSmall;

  /// Displays a text with style of bodyLarge which when hovered animates.
  const SlideAnimatedText.bodyLarge(
    this.value, {
    super.key,
    this.style,
    this.styleOnHover,
    this.onPressed,
  }) : type = _Type.bodyLarge;

  /// Displays a text with style of bodyMedium which when hovered animates.
  const SlideAnimatedText.bodyMedium(
    this.value, {
    super.key,
    this.style,
    this.styleOnHover,
    this.onPressed,
  }) : type = _Type.bodyMedium;

  /// Displays a text with style of bodySmall which when hovered animates.
  const SlideAnimatedText.bodySmall(
    this.value, {
    super.key,
    this.style,
    this.styleOnHover,
    this.onPressed,
  }) : type = _Type.bodySmall;

  /// Displays a text with style of labelLarge which when hovered animates.
  const SlideAnimatedText.labelLarge(
    this.value, {
    super.key,
    this.style,
    this.styleOnHover,
    this.onPressed,
  }) : type = _Type.labelLarge;

  /// Displays a text with style of labelMedium which when hovered animates.
  const SlideAnimatedText.labelMedium(
    this.value, {
    super.key,
    this.style,
    this.styleOnHover,
    this.onPressed,
  }) : type = _Type.labelMedium;

  /// Displays a text with style of labelSmall which when hovered animates.
  const SlideAnimatedText.labelSmall(
    this.value, {
    super.key,
    this.style,
    this.styleOnHover,
    this.onPressed,
  }) : type = _Type.labelSmall;

  /// The type of the text.
  final _Type type;

  /// The text to display.
  final String value;

  /// The style of the text.
  final TextStyle? style;

  /// The style of the text when it is hovered.
  final TextStyle? styleOnHover;

  /// The callback that is called when the button is pressed.
  final void Function()? onPressed;

  @override
  State<StatefulWidget> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<SlideAnimatedText>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _animations;
  var _isHovering = false;

  late TextStyle? _defaultStyle;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.value.length, (index) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
      );
    });

    _animations = _controllers.map((controller) {
      return TweenSequence<Offset>([
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: const Offset(0, 0),
            end: const Offset(0, -1),
          ),
          weight: 50,
        ),
        TweenSequenceItem(
          tween: Tween<Offset>(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ),
          weight: 50,
        ),
      ]).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.ease,
      ));
    }).toList();
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onHover(final bool hover) {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _isHovering = hover;
        });
      }
    });
    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 35), () {
        if (mounted) {
          if (hover) {
            _controllers[i].forward();
          } else {
            _controllers[i].reverse();
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _chooseDefaultStyle();

    return Material(
      color: Colors.transparent,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: ClipRRect(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: widget.value.characters.map((char) {
              int index = widget.value.characters.toList().indexOf(char);
              return SlideTransition(
                position: _animations[index],
                child: Text(
                  char,
                  style: TextStyle(
                    color: context.theme.textTheme.bodyMedium!.color,
                  ).merge(
                    _defaultStyle?.merge(
                      (_isHovering && widget.styleOnHover != null)
                          ? widget.style?.merge(widget.styleOnHover) ??
                              widget.styleOnHover
                          : widget.style,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    ).onPressed(widget.onPressed);
  }

  void _chooseDefaultStyle() {
    switch (widget.type) {
      case _Type.displayLarge:
        _defaultStyle = context.theme.textTheme.displayLarge;
        break;
      case _Type.displayMedium:
        _defaultStyle = context.theme.textTheme.displayMedium;
        break;
      case _Type.displaySmall:
        _defaultStyle = context.theme.textTheme.displaySmall;
        break;
      case _Type.headlineLarge:
        _defaultStyle = context.theme.textTheme.headlineLarge;
        break;
      case _Type.headlineMedium:
        _defaultStyle = context.theme.textTheme.headlineMedium;
        break;
      case _Type.headLineSmall:
        _defaultStyle = context.theme.textTheme.headlineSmall;
        break;
      case _Type.titleLarge:
        _defaultStyle = context.theme.textTheme.titleLarge;
        break;
      case _Type.titleMedium:
        _defaultStyle = context.theme.textTheme.titleMedium;
        break;
      case _Type.titleSmall:
        _defaultStyle = context.theme.textTheme.titleSmall;
        break;
      case _Type.bodyLarge:
        _defaultStyle = context.theme.textTheme.bodyLarge;
        break;
      case _Type.bodyMedium:
        _defaultStyle = context.theme.textTheme.bodyMedium;
        break;
      case _Type.bodySmall:
        _defaultStyle = context.theme.textTheme.bodySmall;
        break;
      case _Type.labelLarge:
        _defaultStyle = context.theme.textTheme.labelLarge;
        break;
      case _Type.labelMedium:
        _defaultStyle = context.theme.textTheme.labelMedium;
        break;
      case _Type.labelSmall:
        _defaultStyle = context.theme.textTheme.labelSmall;
        break;
      default:
    }
  }
}
