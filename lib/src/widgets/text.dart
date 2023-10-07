// ignore_for_file: implementation_imports
import 'package:linkfy_text/src/model/link.dart';
import 'package:flutter/material.dart';
import 'package:linkfy_text/linkfy_text.dart';
import 'package:sr_components/sr_components.dart';

enum _Type {
  heading1,
  heading2,
  heading3,
  heading4,
  heading5,
  heading6,
  subtitle1,
  subtitle2,
  body1,
  body2,
  button,
  caption,
  overline,
}

class SRText extends StatefulWidget {
  // for actual text
  final String? value;
  final TextStyle? style;
  final TextStyle? linkStyle;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final _Type type;
  final Function()? onPressed;

  // for linkify
  final bool linkify;
  final Function(Link)? onLinkPressed;

  // for read more
  final bool withReadMore;
  final String readMoreText;
  final TextStyle? readMoreTextStyle;
  final int? limit;
  final double? height;
  final Function(ScrollNotification)? onScroll;
  final Function(bool)? onPressedShowMore;

  const SRText.heading1(
    this.value, {
    Key? key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : type = _Type.heading1,
        super(key: key);

  const SRText.heading2(
    this.value, {
    Key? key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : type = _Type.heading2,
        super(key: key);

  const SRText.heading3(
    this.value, {
    Key? key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : type = _Type.heading3,
        super(key: key);

  const SRText.heading4(
    this.value, {
    Key? key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : type = _Type.heading4,
        super(key: key);

  const SRText.heading5(
    this.value, {
    Key? key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : type = _Type.heading5,
        super(key: key);

  const SRText.heading6(
    this.value, {
    Key? key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : type = _Type.heading6,
        super(key: key);

  const SRText.subtitle1(
    this.value, {
    Key? key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : type = _Type.subtitle1,
        super(key: key);

  const SRText.subtitle2(
    this.value, {
    Key? key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : type = _Type.subtitle2,
        super(key: key);

  const SRText.body1(
    this.value, {
    Key? key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : type = _Type.body1,
        super(key: key);

  const SRText.body2(
    this.value, {
    Key? key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : type = _Type.body2,
        super(key: key);

  const SRText.button(
    this.value, {
    Key? key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : type = _Type.button,
        super(key: key);

  const SRText.caption(
    this.value, {
    Key? key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : type = _Type.caption,
        super(key: key);

  const SRText.overline(
    this.value, {
    Key? key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : type = _Type.overline,
        super(key: key);

  @override
  State<SRText> createState() => _PTextState();
}

class _PTextState extends State<SRText> {
  bool _showAll = false;

  late TextStyle? _defaultStyle;

  @override
  void initState() {
    super.initState();
    _showAll = widget.limit == null;
  }

  @override
  void didUpdateWidget(covariant SRText oldWidget) {
    if (oldWidget.limit != widget.limit) {
      setState(() {
        _showAll = widget.limit == null;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  void _chooseDefaultStyle() {
    switch (widget.type) {
      case _Type.heading1:
        _defaultStyle = context.theme.textTheme.displayLarge;
        break;
      case _Type.heading2:
        _defaultStyle = context.theme.textTheme.displayMedium;
        break;
      case _Type.heading3:
        _defaultStyle = context.theme.textTheme.displaySmall;
        break;
      case _Type.heading4:
        _defaultStyle = context.theme.textTheme.headlineMedium;
        break;
      case _Type.heading5:
        _defaultStyle = context.theme.textTheme.headlineSmall;
        break;
      case _Type.heading6:
        _defaultStyle = context.theme.textTheme.titleLarge;
        break;
      case _Type.subtitle1:
        _defaultStyle = context.theme.textTheme.titleMedium;
        break;
      case _Type.subtitle2:
        _defaultStyle = context.theme.textTheme.titleSmall;
        break;
      case _Type.body1:
        _defaultStyle = context.theme.textTheme.bodyLarge;
        break;
      case _Type.body2:
        _defaultStyle = context.theme.textTheme.bodyMedium;
        break;
      case _Type.button:
        _defaultStyle = context.theme.textTheme.labelLarge;
        break;
      case _Type.caption:
        _defaultStyle = context.theme.textTheme.bodySmall;
        break;
      case _Type.overline:
        _defaultStyle = context.theme.textTheme.labelSmall;
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.value == null) return Container();
    _chooseDefaultStyle();

    return widget.height != null && _showAll
        ? SizedBox(
            height: widget.height,
            child: NotificationListener<ScrollNotification>(
              onNotification: (val) {
                widget.onScroll?.call(val);
                return true;
              },
              child: SingleChildScrollView(
                child: _textBuilder(),
              ),
            ),
          )
        : _textBuilder();
  }

  Widget _textBuilder() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onPressed,
          child: LinkifyText(
            _limitedText(),
            textStyle: TextStyle(
              color: context.theme.textTheme.bodyMedium!.color,
            ).merge(
              _defaultStyle?.merge(widget.style),
            ),
            overflow: widget.overflow,
            textAlign: widget.textAlign,
            linkStyle: !widget.linkify
                ? _defaultStyle?.merge(widget.style)
                : TextStyle(
                    color: context.theme.colorScheme.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: context.theme.colorScheme.primary,
                  ).merge(widget.linkStyle),
            onTap: widget.onLinkPressed ??
                (link) {
                  if (link.value != null && widget.linkify) {
                    final text = link.value!;
                    debugPrint(text);
                  }
                },
            linkTypes: const [
              LinkType.url,
              LinkType.email,
              LinkType.hashTag,
              LinkType.userTag,
            ],
          ),
        ),
        if (widget.withReadMore &&
            (widget.value?.length ?? 0) > (widget.limit ?? 0))
          const SizedBox(
            height: 8.0,
          ),
        if (widget.withReadMore &&
            (widget.value?.length ?? 0) > (widget.limit ?? 0))
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                _showAll = !_showAll;
              });
              widget.onPressedShowMore?.call(_showAll);
            },
            child: Text(
              _showAll
                  ? '${widget.readMoreText} Less'
                  : '${widget.readMoreText} More',
              style: _defaultStyle?.merge(widget.style).merge(
                    widget.readMoreTextStyle ??
                        TextStyle(
                          color: context.theme.colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
            ),
          )
      ],
    );
  }

  String _limitedText() {
    final text = widget.value ?? '';

    if (_showAll) return text;

    if (widget.limit != null) {
      return text.length > widget.limit!
          ? '${text.substring(0, widget.limit).trim()}...'
          : text;
    }
    return text;
  }
}
