import 'package:mi_credencial/src/utils/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


final List<SingleChildWidget> providers = [

  ChangeNotifierProvider(create: (context)=> ThemeProvider()),

];