import 'package:ecommers/presentation/ui/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/appbar_iconbutton.dart';
import '../widgets/search_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchbarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16,),
            SearchInputTextField(textEditingController: _searchbarController,)
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: SvgPicture.asset(AssetPath.appNavLogo),
      actions: [
        AppbarIconButton(onTap: (){},iconData: Icons.person,),
        const SizedBox(width: 8,),
        AppbarIconButton(onTap: (){}, iconData: Icons.call),
        const SizedBox(width: 8,),
        AppbarIconButton(onTap: (){}, iconData: Icons.notifications_active),
        const SizedBox(width: 8,),
      ],
    );
  }
}



