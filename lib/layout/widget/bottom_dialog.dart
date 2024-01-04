import 'package:flutter/material.dart';

class BottomDialog {
  BottomDialog._();
  static show(BuildContext context, {Function? onPop}) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return SizedBox(
          height: double.infinity,
          // color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () {
                    onPop!();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
