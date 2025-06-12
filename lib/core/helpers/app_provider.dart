import 'package:narra_apps/features/home/providers/navigation_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';



class AppProviders {
  static List<SingleChildWidget> getProviders() {
    return [


      ChangeNotifierProvider(
        create: (context) => MainNavigationProvider(context: context),
      ),
    
    ];
  }
}
