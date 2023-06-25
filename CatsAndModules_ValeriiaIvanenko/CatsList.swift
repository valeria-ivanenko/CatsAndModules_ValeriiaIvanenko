import SwiftUI
import Networking
import FirebaseCrashlytics

struct CatsList: View {
    
    @AppStorage("FirstStart") var alertShouldBeShown = true
    
    @State var animals: [AnimalImage] = []
    @State var hasAppeared: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical){
                VStack {
                    ForEach(self.animals, id: \.self) { animal in NavigationLink(destination: CatDetails(animal: animal)) { CatDetails(animal: animal)
                    }.simultaneousGesture(TapGesture().onEnded{
                        Crashlytics.crashlytics().log("Animal tapped by index: \(animals.firstIndex(of: animal) ?? -1)")
                        Crashlytics.crashlytics().setCustomValue(animals.firstIndex(of: animal) ?? -1, forKey: "last_tapped")
                        // var sum = 10;
                        // for i in 0...10 {
                        //  sum /= i;
                        // }
                        //  let outOfBound = animals[11]
                    })
                    }
                }
            }
            .navigationTitle("Pets")
        }.onAppear {
            guard !hasAppeared else { return }
            hasAppeared = true
            Task {
                animals = await Networking.getAnimals()
            }
        }
        .alert("Hi!", isPresented: $alertShouldBeShown, actions: {
            Button("Yes", role: .cancel, action: {
                Crashlytics.crashlytics().setCrashlyticsCollectionEnabled(true)
                alertShouldBeShown = false
            })
            Button("Nope", role: .destructive, action: {
                Crashlytics.crashlytics()
                    .setCrashlyticsCollectionEnabled(false)
                alertShouldBeShown = false
            })
        }, message: {
            Text("Can we collect data about app crashes?")
        })
        Button("Crash") {
            fatalError("Crash was triggered")
        }
        // some edit
    }
}

struct CatsList_Previews: PreviewProvider {
    static var previews: some View {
        CatsList()
    }
}
