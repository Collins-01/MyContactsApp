import 'package:flutter/material.dart';
import 'package:my_contacts/ui/views/view_states/view_states.dart';
import 'package:provider/provider.dart';

import '../../../core/locator.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelReady;
  final Function(T)? onModelDisposed;

  const BaseView({
    super.key,
    required this.builder,
    this.onModelReady,
    this.onModelDisposed,
  });

  @override
  // ignore: library_private_types_in_public_api
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) widget.onModelReady!(model);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onModelDisposed != null) widget.onModelDisposed!(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
