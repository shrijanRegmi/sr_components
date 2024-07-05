import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_boring_avatars/flutter_boring_avatars.dart';
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
  final String? avatarName;
  final List<String> avatarNames;
  final List<Color> avatarColors;
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
    this.avatarName,
    this.avatarColors = const [],
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
        avatarNames = const [],
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
    this.avatarColors = const [],
    this.avatarNames = const [],
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
        avatarName = null,
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
        avatarColors = const [],
        avatarName = null,
        avatarNames = const [],
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
        avatarColors = const [],
        avatarName = null,
        avatarNames = const [],
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
        avatarColors = const [],
        avatarName = null,
        avatarNames = const [],
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
    if (widget.imgUrl == null) {
      return _errorPlaceholderBuilder(
        name: widget.avatarName ?? '',
      );
    }
    return _baseBuilder(
      CachedNetworkImage(
        width: widget.size.spMin,
        height: widget.size.spMin,
        imageUrl: widget.imgUrl!,
        errorWidget: (context, a, b) => _errorPlaceholderBuilder(
          name: widget.avatarName ?? '',
        ),
        imageBuilder: (context, imageProvider) {
          return Container(
            width: widget.size.spMin,
            height: widget.size.spMin,
            decoration: BoxDecoration(
              color: SRColors.extraLightGrey,
              shape: BoxShape.circle,
              border: widget.border,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _multiNetworkBuilder() {
    final images = widget.imgUrls
        .sublist(0, widget.imgUrls.length > 3 ? 3 : widget.imgUrls.length);

    return _baseBuilder(
      images.length <= 1
          ? _networkStackItemBuilder(
              index: 0,
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
                      index: i,
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
        width: widget.size.spMin,
        height: widget.size.spMin,
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
        width: widget.size.spMin,
        height: widget.size.spMin,
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
        width: widget.size.spMin,
        height: widget.size.spMin,
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
            width: (widget.size + 2).spMin,
            height: (widget.size + 2).spMin,
            padding: EdgeInsets.all(widget.borderGap.spMin),
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
    required final int index,
    required final String? imgUrl,
    required final double size,
    final bool border = true,
  }) {
    final name =
        widget.avatarNames.length <= index ? '' : widget.avatarNames[index];

    return Container(
      width: (size + 2).spMin,
      height: (size + 2).spMin,
      padding: EdgeInsets.all(widget.borderGap.spMin),
      decoration: BoxDecoration(
        color: widget.borderGapColor,
        shape: BoxShape.circle,
        border: border ? widget.border : null,
      ),
      child: imgUrl == null
          ? _errorPlaceholderBuilder(name: name)
          : CachedNetworkImage(
              width: size.spMin,
              height: size.spMin,
              imageUrl: imgUrl,
              errorWidget: (context, a, b) => _errorPlaceholderBuilder(
                name: name,
              ),
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    color: SRColors.extraLightGrey2,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
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

  Widget _errorPlaceholderBuilder({
    required final String name,
  }) {
    return _baseBuilder(
      Container(
        width: widget.size.spMin,
        height: widget.size.spMin,
        decoration: BoxDecoration(
          color: SRColors.extraLightGrey,
          shape: BoxShape.circle,
          border: widget.border,
        ),
        child: BoringAvatars(
          name: name,
          colors: widget.avatarColors.isEmpty
              ? [
                  SRColors.primary,
                  SRColors.secondary,
                ]
              : widget.avatarColors,
          type: BoringAvatarsType.beam,
        ),
      ),
    );
  }
}
