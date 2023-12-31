import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sr_components/sr_components.dart';

enum _Type {
  network,
  multiNetwork,
  file,
  asset,
  letter,
}

class SRAvatar extends StatefulWidget {
  final _Type _type;

  final List<String?> imgUrls;
  final String? imgUrl;
  final File? file;
  final String? assetPath;
  final String? letter;
  final String? userId;

  final double size;
  final Color? color;
  final TextStyle? letterStyle;
  final String? heroTag;
  final Widget? overlayWidget;
  final Border? border;
  final String? package;
  final double spreadFactor;
  final double opacity;
  final bool isSelected;
  final double borderGap;
  final Color? borderGapColor;
  final Function()? onPressed;

  const SRAvatar.network(
    this.imgUrl, {
    super.key,
    this.userId,
    this.size = 45.0,
    this.opacity = 1.0,
    this.color,
    this.heroTag,
    this.overlayWidget,
    this.border,
    this.borderGap = 0.0,
    this.borderGapColor,
    this.isSelected = false,
    this.onPressed,
  })  : imgUrls = const [],
        file = null,
        assetPath = null,
        letter = null,
        letterStyle = null,
        spreadFactor = 1.0,
        package = null,
        _type = _Type.network;

  const SRAvatar.multiNetwork(
    this.imgUrls, {
    super.key,
    this.userId,
    this.size = 45.0,
    this.opacity = 1.0,
    this.color,
    this.heroTag,
    this.overlayWidget,
    this.border,
    this.borderGap = 0.0,
    this.borderGapColor,
    this.isSelected = false,
    this.spreadFactor = 1.0,
    this.onPressed,
  })  : file = null,
        imgUrl = null,
        assetPath = null,
        letter = null,
        letterStyle = null,
        package = null,
        _type = _Type.multiNetwork;

  const SRAvatar.file(
    this.file, {
    super.key,
    this.userId,
    this.size = 45.0,
    this.opacity = 1.0,
    this.color,
    this.heroTag,
    this.overlayWidget,
    this.border,
    this.borderGap = 0.0,
    this.borderGapColor,
    this.isSelected = false,
    this.onPressed,
  })  : imgUrl = null,
        imgUrls = const [],
        assetPath = null,
        letter = null,
        package = null,
        letterStyle = null,
        spreadFactor = 1.0,
        _type = _Type.file;

  const SRAvatar.asset(
    this.assetPath, {
    super.key,
    this.userId,
    this.size = 45.0,
    this.opacity = 1.0,
    this.package,
    this.color,
    this.heroTag,
    this.overlayWidget,
    this.border,
    this.borderGap = 0.0,
    this.borderGapColor,
    this.isSelected = false,
    this.onPressed,
  })  : imgUrl = null,
        imgUrls = const [],
        file = null,
        letter = null,
        letterStyle = null,
        spreadFactor = 1.0,
        _type = _Type.asset;

  const SRAvatar.letter(
    this.letter, {
    super.key,
    this.userId,
    this.letterStyle,
    this.size = 45.0,
    this.opacity = 1.0,
    this.color,
    this.heroTag,
    this.overlayWidget,
    this.border,
    this.borderGap = 0.0,
    this.borderGapColor,
    this.isSelected = false,
    this.onPressed,
  })  : imgUrl = null,
        imgUrls = const [],
        file = null,
        package = null,
        assetPath = null,
        spreadFactor = 1.0,
        _type = _Type.letter;

  @override
  State<SRAvatar> createState() => _SRAvatarState();
}

class _SRAvatarState extends State<SRAvatar> {
  @override
  Widget build(BuildContext context) {
    switch (widget._type) {
      case _Type.network:
        return _networkBuilder();
      case _Type.multiNetwork:
        return _multiNetworkBuilder();
      case _Type.file:
        return _fileBuilder();
      case _Type.asset:
        return _assetBuilder();
      case _Type.letter:
        return _letterBuilder();
      default:
    }
    return Container();
  }

  Widget _networkBuilder() {
    return _baseBuilder(
      Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: SRColors.extraLightGrey,
          shape: BoxShape.circle,
          border: widget.border,
          image: DecorationImage(
            image: CachedNetworkImageProvider('${widget.imgUrl}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _multiNetworkBuilder() {
    final images = widget.imgUrls
        .sublist(0, widget.imgUrls.length > 3 ? 3 : widget.imgUrls.length);

    return _baseBuilder(
      images.length <= 1
          ? _networkStackItemBuilder(
              imgUrl: images.isEmpty ? null : images[0],
              size: widget.size,
              border: false,
            )
          : Stack(
              clipBehavior: Clip.none,
              children: [
                for (var i = 0; i < images.length; i++)
                  Positioned(
                    top: i == 1 && images.length == 2
                        ? 10.0 * widget.spreadFactor
                        : i == 0
                            ? null
                            : i == 1
                                ? 15.0 * widget.spreadFactor
                                : i == 2
                                    ? 5.0 * widget.spreadFactor
                                    : null,
                    right: i == 1 && images.length == 2
                        ? null
                        : i == 0 || i == 1
                            ? 10.0 * widget.spreadFactor
                            : null,
                    left: i == 1 && images.length == 2
                        ? 5.0 * widget.spreadFactor
                        : i == 2
                            ? 10.0 * widget.spreadFactor
                            : null,
                    child: _networkStackItemBuilder(
                      imgUrl: images[i],
                      size: i == 0 ? widget.size - 3 : widget.size - 6,
                    ),
                  ),
              ],
            ),
      border: images.length <= 1 ? true : false,
    );
  }

  Widget _fileBuilder() {
    return _baseBuilder(
      Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: FileImage(widget.file!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _assetBuilder({
    final String? assetPath,
    final String? package,
  }) {
    return _baseBuilder(
      Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
              assetPath ?? widget.assetPath!,
              package: package ?? widget.package,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _letterBuilder() {
    return _baseBuilder(
      Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '${widget.letter}',
            style: widget.letterStyle,
          ),
        ),
      ),
    );
  }

  Widget _baseBuilder(
    Widget child, {
    final bool border = true,
  }) {
    return Opacity(
      opacity: widget.opacity,
      child: Stack(
        children: [
          Container(
            width: (widget.size + 2).w,
            height: (widget.size + 2).h,
            padding: EdgeInsets.all(widget.borderGap.w),
            decoration: BoxDecoration(
              color: widget.borderGapColor,
              shape: BoxShape.circle,
              border: border ? widget.border : null,
            ),
            child: child,
          ).onPressed(widget.onPressed),
          if (widget.isSelected) widget.overlayWidget ?? _overlayBuilder(),
        ],
      ),
    );
  }

  Widget _networkStackItemBuilder({
    required final String? imgUrl,
    required final double size,
    final bool border = true,
  }) {
    return Container(
      width: (size + 2).w,
      height: (size + 2).h,
      padding: EdgeInsets.all(widget.borderGap.w),
      decoration: BoxDecoration(
        color: widget.borderGapColor,
        shape: BoxShape.circle,
        border: border ? widget.border : null,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: SRColors.extraLightGrey2,
          shape: BoxShape.circle,
          image: imgUrl == null
              ? null
              : DecorationImage(
                  image: CachedNetworkImageProvider(imgUrl),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  Widget _overlayBuilder() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: SRColors.secondary.withOpacity(0.5),
        ),
        child: const Center(
          child: Icon(
            Icons.check_rounded,
            color: Colors.white,
            size: 20.0,
          ),
        ),
      ).pad(2.0),
    );
  }
}
