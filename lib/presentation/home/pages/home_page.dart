import 'package:brain_box_ai/assets/assets.gen.dart';
import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../profile_setting/pages/profile_setting_page.dart';
import '../../prompt_management/pages/prompt_management_page.dart';
import '../../widgets/tab_button.dart';
import '../widgets/home_content_widget.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 3);
    final selectedTab = useState(0);

    useEffect(() {
      void listener() {
        selectedTab.value = tabController.index;
      }

      tabController.addListener(listener);
      return () => tabController.removeListener(listener);
    }, [tabController]);

    return Scaffold(
      body: _buildTabPage(tabController),
      bottomNavigationBar:
          _buildBottomNavBar(context, tabController, selectedTab.value),
    );
  }

  Widget _buildTabPage(TabController tabController) {
    return TabBarView(
      controller: tabController,
      children: const [
        HomeContentWidget(),
        PromptManagementPage(),
        ProfileSettingPage(),
      ],
    );
  }

  Widget _buildBottomNavBar(
      BuildContext context, TabController tabController, int value) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
      decoration: BoxDecoration(color: context.appColors.surface, boxShadow: [
        BoxShadow(
            color: context.appColors.outline,
            blurRadius: 10,
            offset: const Offset(0, -4))
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _buildListTabButton(value, tabController),
      ),
    );
  }

  List<Widget> _buildListTabButton(int value, TabController tabController) {
    return [
      TabButton(
          icon: Assets.icHome.path,
          isSelect: value == 0,
          onPressed: () {
            value = 0;
            tabController.animateTo(0);
          }),
      TabButton(
          icon: Assets.icFourSquares.path,
          isSelect: value == 1,
          onPressed: () {
            value = 1;
            tabController.animateTo(1);
          }),
      TabButton(
          icon: Assets.icProfile.path,
          isSelect: value == 2,
          onPressed: () {
            value = 2;
            tabController.animateTo(2);
          }),
    ];
  }
}
