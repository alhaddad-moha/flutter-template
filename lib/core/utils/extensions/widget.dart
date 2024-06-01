import 'package:flutter/material.dart';

extension WidgetEx on Widget{

  SliverToBoxAdapter get toSliverToBoxAdapter => SliverToBoxAdapter(child: this,);

}