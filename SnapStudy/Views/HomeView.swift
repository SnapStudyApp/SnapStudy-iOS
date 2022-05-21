/*
 Home Page Layout:
 
 Includes flashcards for practicing selected
 language. More options for further updates.
*/

import SwiftUI
import CoreHaptics

struct HomeView: View {
    
    // State variables for dragging flashcard state
    
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    // Variable for device haptics
    
    @State private var engine: CHHapticEngine?
    
    
    var body: some View {
        
        // Variables for long pressing and dragging flashcards
        
        // Drag specific gesture
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                offset = .zero
                isDragging = false
            }
        
        // Long press specific gesture
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        // Drag gesture gets triggered only when long pressed
        let combined = pressGesture.sequenced(before: dragGesture)
        
        VStack{
            Text("Home Page")
                .onTapGesture {
                    print("Text Tapped")
                }
        }
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
            .onAppear(perform: prepareHaptics)
            .onTapGesture(perform: tapHaptic)
    }
    
    
    // Haptic feedback functions
    
    // Prepares haptics if supported, else returns
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error: \(error.localizedDescription)")
        }
    }
    
    // Tap haptic feedback
    func tapHaptic() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play success haptic with error: \(error.localizedDescription)")
        }
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
