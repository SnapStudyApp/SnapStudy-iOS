//
//  ContentView.swift
//  SnapStudy
//

import SwiftUI

struct ContentView: View {
   
  var body: some View {
    
      /*
      We have three tabs:
      - Home:
          Here, users can learn from their flashcards.
      - Camera:
          Here, users can capture daily objects.
      - Settings:
          Here, users can change app settings.
      */
      
      TabView {
          HomeView()
              .tabItem {
                  Image(systemName: "house.fill")
                }
          CameraView()
              .tabItem {
                  Image(systemName: "camera.fill")
              }
          SettingsView()
              .tabItem {
                  Image(systemName: "gearshape.fill")
              }
      }
  }

}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()

  }
}
