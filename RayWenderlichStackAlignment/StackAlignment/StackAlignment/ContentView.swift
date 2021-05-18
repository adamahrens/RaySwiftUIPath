//
//  ContentView.swift
//  StackAlignment
//
//  Created by Adam Ahrens on 5/17/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      HStack(alignment: .bottom) {
        Image("Cake VStack")
          .resizable()
          .scaledToFit()
        Text("Yummy!")
          .padding()
        Image("Pancake VStack")
          .resizable()
          .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
