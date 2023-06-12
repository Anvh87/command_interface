import "package:command_interface/pages/sp_2000/sp_2000_page.dart";
import "package:flutter/material.dart";

// Route Names
const String sp2000Route = "/sp2000";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case sp2000Route:
      return MaterialPageRoute(builder: (_) => const Sp2000Page());
    default:
      return MaterialPageRoute(builder: (_) => const Sp2000Page());
  }
}
