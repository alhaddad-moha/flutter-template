import 'package:template/common/widgets/remove_glow_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomFormTemplate extends StatelessWidget {
  const CustomFormTemplate({super.key, required this.form, required this.children, this.column = false});

  final bool column;
  final FormGroup form;
  final List<Widget> children;



  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: () => form,
      builder: (context, form, child) {
        return Align(
          alignment: AlignmentDirectional.topStart,
          child: RemoveGlowWrapper(
            child: column ? Column(
              children: [
                ...children,
              ],
            ) : ListView(
              children: [
                ...children,
              ],
            ),
          )

          /*
          CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  ...children,
                ]),
              )
            ],
          ),

           */
        );
      },
    );
  }
}