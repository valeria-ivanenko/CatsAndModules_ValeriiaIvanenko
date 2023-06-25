import SwiftUI
import Networking
import FirebasePerformance

struct CatDetails: View {
    
    let animal: AnimalImage
    @State var image: Image?
    
    var body: some View {
        VStack {
            image?.resizable().scaledToFit()
        } .onAppear() {
            Task {
                image = await Networking.uploadImage(url: animal.url) ?? Image(systemName: "photo")
            }
        }
    }
}

//struct CatDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        CatDetails(cat: CatImage(url: URL(string: "https://cdn2.thecatapi.com/images/ebv.jpg") ?? URL(string: "")!))
//    }
//}

