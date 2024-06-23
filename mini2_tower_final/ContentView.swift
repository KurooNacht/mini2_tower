import SwiftUI
import SceneKit

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel(scene: "art.scnassets/tower_autumn.scn")
    
    
    var body: some View {
        ZStack {
            SceneKitView(scene: viewModel.scene)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onEnded { _ in
                            viewModel.handleSwipe()
                            
                        }
                )            
            VStack {
                Text("Swipe to Rotate the Tower")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(8)
                    .padding(.top, 50)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
