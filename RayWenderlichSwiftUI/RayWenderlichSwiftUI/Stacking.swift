//
//  Stacking.swift
//  RayWenderlichSwiftUI
//
//  Created by Adam Ahrens on 4/19/21.
//

import SwiftUI

struct Stacking: View {
  var body: some View {
    VStack {
      HStack(alignment: .center, spacing: 20) {
        Thumbnail(title: "INK")
        
        MusicDetails()
      }
      
      VStack(alignment: .center, spacing: 20) {
        
        Text("Currently playing Rocking The Boat, Grave Mistake, and American Nightmare")
        MusicButtons()
      }
    }
   
    .padding()
    .frame(minHeight: 150, maxHeight: 400)
  }
}

struct Stacking_Previews: PreviewProvider {
    static var previews: some View {
        Stacking()
      
      Thumbnail(title: "INK")
        .padding()
        .previewLayout(.fixed(width: 250, height: 250))
    }
}

struct Thumbnail: View {
  let title: String
  var body: some View {
    ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
      ZStack {
        RoundedRectangle(cornerRadius: 12)
          .foregroundColor(.accentColor)
          .aspectRatio(1, contentMode: .fit)
          .shadow(radius: 10)
        
        Image(systemName: "play.fill")
          .resizable()
          .opacity(0.8)
          .frame(width: 50, height:50)
      }
      
      Text(title)
        .font(.largeTitle)
        .fontWeight(.semibold)
       
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
    }
    .padding()
    .foregroundColor(.white)
  }
}

struct MusicButton: View {
  let label: String
  let systemImage: String
  
  var body: some View {
    HStack {
      Spacer()
      Label(label, systemImage: systemImage)
      Spacer()
    }
    .padding(.vertical)
    .background(Color.gray.opacity(0.5))
    .cornerRadius(12)
  }
}

struct MusicButtons: View {
  var body: some View {
    HStack(spacing: 12.0) {
      Button(action: { print("Playing") }, label: {
        MusicButton(label: "Playing", systemImage: "play.fill")
      })
      
      Button(action: { print("Shuffling") }, label: {
        MusicButton(label: "Shuffle", systemImage: "shuffle")
      })
    }
  }
}

struct MusicDetails: View {
  var body: some View {
    VStack(alignment: .leading) {
      Text("Ice Nine Kills")
        .font(.title)
        .fontWeight(.semibold)
      
      Text("Apple Music for aahrens")
        .font(.title)
        .fontWeight(.light)
        .foregroundColor(.accentColor)
      
      Text("Updated Saturday")
        .font(Font.system(.body).smallCaps())
    }
  }
}
