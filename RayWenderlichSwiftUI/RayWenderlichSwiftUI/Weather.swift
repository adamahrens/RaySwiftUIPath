//
//  Weather.swift
//  RayWenderlichSwiftUI
//
//  Created by Adam Ahrens on 4/13/21.
//

import SwiftUI

struct Weather: View {
  
  private let gradient = Gradient(colors: [Color.white, Color.blue])
  
  var body: some View {
    VStack {
      Image(systemName: "sun.max.fill")
        .resizable()
        .renderingMode(.original)
        .frame(width: 70, height: 70)
      
      Text("Sunny")
        .foregroundColor(.white)
        .font(.title)
        .fontWeight(.semibold)
        .padding()
      
      Text("H: 61 L: 44")
        .foregroundColor(.white)
        .font(.subheadline)
        .opacity(0.7)
    }
    .padding()
    .background(
      LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
    .cornerRadius(12)
  }
}

struct Weather_Previews: PreviewProvider {
    static var previews: some View {
        Weather()
    }
}
