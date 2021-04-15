//
//  Status.swift
//  RayWenderlichSwiftUI
//
//  Created by Adam Ahrens on 4/14/21.
//

import SwiftUI

enum Mood: String, CaseIterable {
  case happy = "😀"
  case sad = "☹️"
  case upsidedown = "🙃"
  case cat = "🐱"
}

struct Status: View {
  @State private var mood = ""
  @State private var favoriteColor = Color.black
  @State private var emoji = Mood.happy
  
  var body: some View {
    VStack {
      Text("Set your status")
      
      TextField("Mood", text: $mood)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
      
      ColorPicker("Favorite Color", selection: $favoriteColor)
        .padding()
      
      Picker("", selection: $emoji) {
        ForEach(Mood.allCases, id: \.self) { mood in
          Text(mood.rawValue)
        }
      }.pickerStyle(SegmentedPickerStyle())
      .padding()
      
      VStack {
        Text(emoji.rawValue)
          .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
        Text(mood)
          .foregroundColor(.white)
          .font(.title)
          .fontWeight(.semibold)
          .padding(.bottom, 10)
          .padding([.bottom, .leading, .trailing], /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
      }.background(favoriteColor)
      .cornerRadius(8.0)
    }
  }
}

struct Status_Previews: PreviewProvider {
    static var previews: some View {
        Status()
    }
}
