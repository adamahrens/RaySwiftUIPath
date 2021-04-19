//
//  Challenge.swift
//  RayWenderlichSwiftUI
//
//  Created by Adam Ahrens on 4/19/21.
//

import SwiftUI

enum Condition {
  case sunny
  case cloudy
  case raining
  case partialSun
}

struct Forecast: Identifiable {
  let id = UUID()
  let condtion: Condition
  let time: String
  let high: String
  let low: String
  
  var description: String {
    switch condtion {
      case .sunny : return "Sunny"
      case .raining: return "Rainy"
      case .cloudy: return "Cloudy"
      case .partialSun: return "Partial Sun"
    }
  }
  
  var imageName: String {
    switch condtion {
      case .sunny : return "sun.max.fill"
      case .raining: return "cloud.rain.fill"
      case .cloudy: return "cloud.fill"
      case .partialSun: return "cloud.sun.fill"
    }
  }
  
  var tint: Color {
    switch condtion {
      case .sunny : return Color.yellow
      case .raining: return Color.blue
      case .cloudy: return Color.white
      case .partialSun: return Color.white
    }
  }
}

struct CurrentWeather: View {
  let city: String
  let temp: String
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(city)
        .font(Font.system(size: 42))
        .fontWeight(.light)
      
      
      Text(temp)
        .font(Font.system(size: 52))
        .fontWeight(.light)
    }
    .foregroundColor(.white)
  }
}

struct HighLow: View {
  let forecast: Forecast
  
  var body: some View {
    VStack(alignment: .trailing) {
      Image(systemName: forecast.imageName)
        .resizable()
        .foregroundColor(forecast.tint)
        .frame(width: 30, height: 30)
      Text(forecast.description)
      Text("H:\(forecast.high) L:\(forecast.low)")
    }
    .foregroundColor(.white)
  }
}

struct HourlyWeather: View {
  let forecast: Forecast
  
  var body: some View {
    VStack {
      Text(forecast.time)
        .fontWeight(.light)
      
      Image(systemName: forecast.imageName)
        .resizable()
        .frame(width: 30, height: 30)
        .foregroundColor(forecast.tint)
      
      Text(forecast.high)
        .fontWeight(.semibold)
    }
    .foregroundColor(.white)
  }
}

struct Challenge: View {
  private let currentForecast = Forecast(condtion: .sunny, time: "8AM", high: "68°", low: "42°")
  
  private let forecasts = [
    Forecast(condtion: .cloudy, time: "8AM", high: "63°", low: "42°"),
    Forecast(condtion: .sunny, time: "9AM", high: "63°", low: "42°"),
    Forecast(condtion: .cloudy, time: "10AM", high: "67°", low: "42°"),
    Forecast(condtion: .raining, time: "11AM", high: "67°", low: "42°"),
    Forecast(condtion: .sunny, time: "12PM", high: "71°", low: "42°"),
    Forecast(condtion: .sunny, time: "1PM", high: "72°", low: "42°"),
  ]
  
  var body: some View {
    VStack(spacing: 0) {
      
      HStack {
        CurrentWeather(city: "Saint Paul", temp: "37°")
          .padding(.leading, 10)
        
        Spacer()
        
        HighLow(forecast: currentForecast)
          .padding(.trailing, 10)
      }
      .padding(.bottom, 10)
      
      Divider()
        .padding(.bottom, 30)
    
      HStack {
        ForEach(forecasts) { f in
          Spacer()
          HourlyWeather(forecast: f)
          Spacer()
        }
      }
      
      
      Spacer()
    }
    .background(Color("WeatherBlue"))
  }
}

struct Challenge_Previews: PreviewProvider {
  static var previews: some View {
    Challenge()
  }
}
