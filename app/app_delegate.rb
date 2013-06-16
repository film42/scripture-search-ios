class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    search_view = SearchController.alloc.init
    navigation_controller = UINavigationController.alloc.initWithRootViewController(search_view)
    @window.rootViewController = navigation_controller
    @window.makeKeyAndVisible

    true
  end
end
