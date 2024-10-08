import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sr_components/sr_components.dart';

class SRInput extends StatefulWidget {
  const SRInput({
    Key? key,
    this.controller,
    this.textStyle,
    this.autoFocus = false,
    this.contentPadding,
    this.hintText = '',
    this.hintStyle,
    this.onPressed,
    this.onFormSubmitted,
    this.onChanged,
    this.enabled = true,
    this.leading,
    this.trailing,
    this.height,
    this.password = false,
    this.textCapitalization = TextCapitalization.none,
    this.title,
    this.initialValue,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.limit = 5000,
    this.minLines,
    this.maxLines,
    this.inputFormatters = const [],
  }) : super(key: key);

  final TextEditingController? controller;
  final TextStyle? textStyle;
  final bool autoFocus;
  final String hintText;
  final TextStyle? hintStyle;
  final EdgeInsets? contentPadding;
  final Function()? onPressed;
  final Function(String)? onFormSubmitted;
  final Function(String)? onChanged;
  final bool enabled;
  final Widget? leading;
  final Widget? trailing;
  final double? height;
  final bool password;
  final TextCapitalization textCapitalization;
  final String? title;
  final String? initialValue;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final int limit;
  final int? minLines;
  final int? maxLines;
  final List<TextInputFormatter> inputFormatters;

  @override
  State<SRInput> createState() => _PInputState();
}

class _PInputState extends State<SRInput> {
  bool _passwordVisible = false;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = !widget.password;

    if (widget.controller != null) {
      _controller = widget.controller!;
    }
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }
  }

  @override
  void didUpdateWidget(covariant SRInput oldWidget) {
    if (widget.controller != null &&
        oldWidget.controller != widget.controller) {
      _controller = widget.controller!;
    }
    if (widget.initialValue != null &&
        oldWidget.initialValue != widget.initialValue) {
      _controller.text = widget.initialValue!;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(
          offset: _controller.text.length,
        ),
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: SRText.titleMedium(widget.title!),
          ),
        if (widget.title != null)
          SizedBox(
            height: 10.h,
          ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onPressed,
          child: TextFormField(
            controller: _controller,
            style: widget.textStyle,
            autofocus: widget.autoFocus,
            onTap: widget.onPressed,
            inputFormatters: widget.inputFormatters,
            enabled: widget.enabled,
            obscureText: !_passwordVisible,
            maxLength: widget.limit,
            keyboardType: widget.textInputType,
            minLines: widget.minLines ??
                (widget.textInputType == TextInputType.multiline ? 1 : null),
            maxLines: widget.maxLines ??
                (widget.textInputType == TextInputType.multiline ? 8 : 1),
            textInputAction: widget.textInputAction,
            onFieldSubmitted: widget.onFormSubmitted,
            textCapitalization: widget.textCapitalization,
            onChanged: (val) {
              widget.onChanged?.call(val);
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              counterText: '',
              contentPadding: widget.contentPadding ??
                  context.theme.inputDecorationTheme.contentPadding,
              prefixIcon: widget.leading,
              suffixIcon: widget.trailing ??
                  (widget.password
                      ? IconButton(
                          icon: Icon(
                            !_passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          iconSize: 22.0,
                          splashColor: Colors.transparent,
                          splashRadius: 1.0,
                          color: context
                              .theme.inputDecorationTheme.suffixIconColor,
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        )
                      : null),
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        if (widget.limit != 5000)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: SRText.bodyLarge(
                  '${widget.limit - _controller.text.length}',
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
