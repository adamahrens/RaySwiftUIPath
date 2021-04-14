//
//  StateBinding.swift
//  RayWenderlichSwiftUI
//
//  Created by Adam Ahrens on 4/13/21.
//

import SwiftUI

struct StateBinding: View {
  @State private var background: Color = .black
  @State private var foreground: Color = .white
  @State private var radius: CGFloat = 50
  
  var body: some View {
    VStack {
      Image(systemName: "swift")
        .resizable()
        .scaledToFit()
        .padding(25)
        .foregroundColor(self.foreground)
        .opacity(0.7)
        .background(self.background)
        .cornerRadius(radius)
      
      ColorPicker("Background", selection: $background)
      ColorPicker("Foreground", selection: $foreground)
      Section(header: Text("Radius")) {
        Slider(value: $radius, in: 1...70)
          .accentColor(background)
      }
    }.padding()
  }
}

struct StateBinding_Previews: PreviewProvider {
    static var previews: some View {
        StateBinding()
    }
}
