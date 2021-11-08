/// Copyright (c) 2019 Razeware LLC
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

struct Leaf: View {
  let isCurrent: Bool
  let isComplete: Bool
  let rotation: Angle
  
  var body: some View {
    Capsule()
      .stroke(isCurrent ? Color.white : Color.gray, lineWidth: 8)
      .frame(width: 20, height: isComplete ? 20 : 50)
      .offset(
        isCurrent ? .init(width: 10, height: 0) : .init(width: 40, height: 70)
      )
      .scaleEffect(isCurrent ? 0.5 : 1)
      .rotationEffect(isComplete ? .zero : rotation)
      .animation(.easeIn(duration: 1.5))
  }
}

struct SpinnerView: View {
 
  let leavesCount = 12
  
  @State private var currentIndex = -1
  @State private var isComplete = false
  @State private var isVisible = true
  
  var body: some View {
    VStack {
      if isVisible {
        ZStack {
          ForEach(0 ..< leavesCount) { index in
            let degrees = (.init(index) / .init(leavesCount)) * 360.0
            let current = index == currentIndex
            Leaf(isCurrent: current, isComplete: isComplete, rotation: .init(degrees: degrees))
          }
        }
        .onAppear(perform: animate)
      }
    }
  }
  
  func animate() {
    var timersFired = 0
    Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { timer in
      currentIndex = (currentIndex + 1) % leavesCount
      timersFired += 1
      
      if timersFired == 30 {
        timer.invalidate()
        isComplete = true
        currentIndex = -1
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
          isVisible = false
        }
      }
    }
  }
}

struct SpinnerView_Previews : PreviewProvider {
  static var previews: some View {
    SpinnerView()
  }
}
