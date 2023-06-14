import 'package:flutter/material.dart';
import 'package:command_interface/core/constants/constants.dart';
import 'package:command_interface/core/constants/responsive.dart';
import 'package:command_interface/core/controllers/controller.dart';
import 'package:command_interface/core/widgets/menu.dart';
import 'components/dashboard_content.dart';

import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: const DrawerMenu(),
      key: context.read<Controller>().scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                child: DrawerMenu(),
              ),
            const Expanded(
              flex: 5,
              child: DashboardContent(),
            )
          ],
        ),
      ),
    );
  }
}
