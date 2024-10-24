import 'package:flutter/material.dart';
import 'package:mvpassessmenttest/View/order_history_view.dart';
import 'package:mvpassessmenttest/View/products_home_view.dart';
import 'package:mvpassessmenttest/View/user_favourites_view.dart';
import 'package:mvpassessmenttest/View/user_profile_dashboard_view.dart';
import 'package:mvpassessmenttest/ViewModel/cart_view_model.dart';
import 'package:mvpassessmenttest/ViewModel/products_home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

 TabItem _selectedTab = TabItem.home;

final ProductsHomeViewModel productsHomeViewModel = ProductsHomeViewModel();
  final List<Widget> _tabBarViews = [
    ProductsHomeView(),
    UserFavouritesView(),
    OrderHistoryView(),
    UserProfileDashboardView()
  ];

  String _presentTabItemViewTitle(TabItem tab) {
 switch (tab) {
  case TabItem.home:
  return 'Home Page';
case TabItem.favourites:
return 'Favourites';
case TabItem.history:
return 'Order History';
default: 
return 'Dashboard';
 }
  }

  void _whenTappedOnTabBarItem(TabItem tab) {
    setState(() {
      _selectedTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     
      appBar: AppBar(
        title: Text(_presentTabItemViewTitle(_selectedTab)),
        actions: [
          IconButton(
            onPressed: () => productsHomeViewModel.navigateTocartView(context), 
            icon: const Icon(Icons.shopping_cart),
            )
        ],
      ),
      body: _tabBarViews[_selectedTab.index],
bottomNavigationBar: BottomNavigationBar(
  items: const <BottomNavigationBarItem> [
     BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites'
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'History'
            ),
             BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
  ],
  currentIndex: _selectedTab.index,
  onTap: (index) => _whenTappedOnTabBarItem(TabItem.values[index]),

  ),
    );
  }
}

enum TabItem {
home,
favourites,
history,
dashboard
  }
