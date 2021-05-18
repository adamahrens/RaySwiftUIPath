/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ContentView: View {
  let cornerRadius: CGFloat = 7.5

  var body: some View {
    HStack(alignment: .top) {
      VStack {
        Image("RW")
          .resizable()
          .frame(width: 90, height: 90)
          .border(Color.white, width: 3)
          .cornerRadius(cornerRadius)
        
        Text("Following")
          .padding(6)
          .font(.body)
          .background(Color.blue)
          .foregroundColor(.white)
          .clipShape(Capsule())
      }
      
      VStack(alignment: .leading, spacing: 8) {
        Text("raywenderlich.com")
          .foregroundColor(.white)
          .font(.title)
        
        HStack(alignment: .lastTextBaseline) {
          Text("@rwenderlich")
            .foregroundColor(.white)
          Text("FOLLOWS YOU")
            .padding(6)
            .background(Color.green.opacity(0.5))
            .cornerRadius(cornerRadius)
        }
        
        Text(
          "We are a friendly and supportive community of mobile developers. "
        )
        .lineSpacing(-.infinity)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color(red: 0.55, green: 0.45, blue: 0.75)
      ContentView()
    }
      .edgesIgnoringSafeArea(.all)
  }
}
