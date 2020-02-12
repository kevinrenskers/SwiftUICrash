# SwiftUICrash

This is the `NavigationView` workaround. The `RootView` is now wrapped in a `NavigationView` with a hidden navigation bar. On iPhone, all is well, and the crash no longer happens!

However, when you run this on the iPad, you will see that the right side of the screen is no longer showing the "Hello iPad!" text. 

Using `.navigationViewStyle(StackNavigationViewStyle())` on the `RootView`'s new `NavigationView` solves that problem, but now you have a double height navigation bar.