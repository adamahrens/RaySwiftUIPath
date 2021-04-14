//
//  ContentView.swift
//  RayWenderlichSwiftUI
//
//  Created by Adam Ahrens on 4/13/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Text("Hello, world!")
        .padding()
      
      Image(systemName: "swift")
      
      HStack {
        Image(systemName: "swift")
          .resizable()
          .frame(width: 100, height: 100)
        Text("Swift man!")
          .font(.largeTitle)
          .foregroundColor(Color.green)
          .padding(.leading, 10)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
