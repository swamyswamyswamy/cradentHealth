import 'package:flutter/material.dart';

class AppLoaders {
  static showLoading({required BuildContext context, required String note}) {
    showModalBottomSheet<void>(
        isScrollControlled: true,
        // isDismissible: false, // Prevent closing on outside tap
        // enableDrag: false, // Prevent closing by dragging down
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false, // Disables the back button
            child: Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height: 70,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90)),
                          child: const Align(
                              child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Colors.black,
                            ),
                          )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            note,
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'PopM',
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          );
        });
  }
}
