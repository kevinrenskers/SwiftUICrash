# SwiftUICrash

A very strange crash happening in SwiftUI, where if you have a resizable image but then change the view hierarchy, you get a crash.

If you run the app and click on the trailing navigation bar item, you will see that the app crashes. Some interesting things to note:

1. If you first rotate your device, the crash does not happen.
2. If you press the button in the center of the screen, the crash does not happen.
3. If you push another page on the navigation stack first and go back again, the crash also doesn't happen.
4. If you wrap the `RootView`'s `Group` in either a `NavigationView` or `TabView`, the crash does not happen. But sadly the TabView's tabbar can't be hidden, and while the navigation bar can be hidden, it causes massive problems running on the iPad.

See also https://stackoverflow.com/questions/60028961/swiftui-crash-precondition-failure-attribute-failed-to-set-an-initial-value.