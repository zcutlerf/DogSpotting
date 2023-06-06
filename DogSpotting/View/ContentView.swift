//
//  ContentView.swift
//  DogSpotting
//
//  Created by Zoe Cutler on 4/6/23.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    @StateObject var dogVM = DogViewModel()
    
    @State private var isShowingNewSpotSheet = false
    @State var hapticEngine: CHHapticEngine?
    
    func playHaptic() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try hapticEngine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
    
    init() {
        // start the haptic engine
        do {
            try hapticEngine = CHHapticEngine()
            try hapticEngine?.start()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        NavigationStack {
            // TODO: add accessibility labels to views
            // TODO: add an accent color, make sure it is usable in light, dark modes; normal, high contrast modes
            List(dogVM.dogsSeen) { dog in
                HStack {
                    //User-inputted image of the dog spotted
                    Image(uiImage: dog.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 200.0)
                    
                    //Information about the dog spotted
                    VStack(alignment: .leading) {
                        //Dog's name
                        Text(dog.name)
                            .font(.title)
                        Text(dog.size.rawValue)
                            .font(.title2)
                        
                        //Time when dog was seen
                        Text("Seen on \(dog.dateSeen.formatted())")
                            .foregroundColor(.secondary)
                            .accessibilityLabel(dogVM.formattedDate(dog.dateSeen))
                    }
                }
            }
            .sheet(isPresented: $isShowingNewSpotSheet, content: {
                NewSpotView(dogVM: dogVM)
            })
            .navigationTitle("Dogs Spotted")
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingNewSpotSheet.toggle()
                        playHaptic()
                    } label: {
                        Label("Add Dog", systemImage: "eyes")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
