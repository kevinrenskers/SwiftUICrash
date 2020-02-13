import SwiftUI
import UIKit

final class AppStore: ObservableObject {
  @Published var showingDetails = true
}

struct CustomImage: UIViewRepresentable {
  var image: UIImage
  var frame: CGRect

  func makeUIView(context: Context) -> UIView {
    let imageView = UIImageView(frame: frame)
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = image

    let view = UIView(frame: frame)
    view.translatesAutoresizingMaskIntoConstraints = false

    view.addSubview(imageView)

    return view
  }

  func updateUIView(_ uiView: UIView, context: Context) {
  }
}


struct RootView: View {
  @EnvironmentObject private var store: AppStore

  var body: some View {
    Group {
      if store.showingDetails {
        DetailsView()
      } else {
        ListView()
      }
    }
  }
}

struct DetailsView: View {
  @EnvironmentObject private var store: AppStore

  var body: some View {
    NavigationView {
      ZStack {
        GeometryReader { geo in
          CustomImage(image: UIImage(named: "bg")!, frame: CGRect(x: 0, y: 0, width: geo.size.width, height: geo.size.height))
            .frame(width: geo.size.width, height: geo.size.height)
          }
          .edgesIgnoringSafeArea(.all)

        Button("List") {
          self.store.showingDetails = false // <- this works fine
        }
        .padding(20)
        .background(Color.white)
      }
      .navigationBarTitle(Text("Details"))
      .navigationBarItems(trailing: trailingNavigationBarItem)

      Text("Hello iPad!")
    }
  }

  private var trailingNavigationBarItem: some View {
    Button("List") {
      self.store.showingDetails = false // <- this crashes the app!
    }
  }
}

struct ListView: View {
  @EnvironmentObject private var store: AppStore

  var body: some View {
    NavigationView {
      Button("Load details") {
        self.store.showingDetails = true
      }
      .padding(20)
      .background(Color.white)
      .navigationBarTitle("List")
    }
  }
}
