import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/network_controllers/network_connectivity.dart';
import 'package:time_craft/view/core/styles.dart';

class NetworkErrorWidget extends StatelessWidget {
  const NetworkErrorWidget({super.key, this.replacement});
  final Widget? replacement;
  @override
  Widget build(BuildContext context) {
    return Consumer<NetworkConnectivity>(
      builder: (context, value, child) {
        return Visibility(
          visible: !value.isConnectedToNetwork,
          replacement: replacement ?? const SizedBox(),
          child: Container(
            height: khieght * 0.05,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(khieght * 0.005)),
            child: Center(
              child: Text('Internet connection disabled', style: interwhitebold),
            ),
          ),
        );
      },
    );
  }
}
