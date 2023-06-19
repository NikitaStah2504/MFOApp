//
//  LoadView.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 19.06.2023.
//

import SwiftUI

struct LoadView: View {
  @State private var progress: Double = 0.0
  @State private var procentProgress: Int = 0
  @State private var timeRemaining: Int = 50
  @State private var showModal: Bool = false {
          willSet {
              UIView.setAnimationsEnabled(false)
          } didSet {
              DispatchQueue.main.async {
                  UIView.setAnimationsEnabled(true)
              }
          }
      }
  
  let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
 // @AppStorage("firstLaunch") var firstLaunch: Bool = true
  
  var body: some View {
    ZStack {
      Color.contentMain
        .ignoresSafeArea()
      VStack {
        ZStack {
          Text("\(procentProgress)%")
            .font(.system(size: 21, weight: .medium))
            .foregroundColor(Color.white)
            .onReceive(timer) { _ in
              if timeRemaining > 0 {
                procentProgress += 2
                timeRemaining -= 1
              }
            }
          Circle()
            .stroke(
              Color.gray,
              lineWidth: 20
            )
          Circle()
            .trim(from: 0, to: progress)
            .stroke(
              Color.accentMain,
              style: StrokeStyle(
                lineWidth: 20,
                lineCap: .round
              )
            )
            .rotationEffect(.degrees(-90))
        }.frame(width: 166, height: 166)
        Text("Выбираем, что можно предложить…")
          .font(.system(size: 21, weight: .medium))
          .foregroundColor(.white)
          .padding()
      }
    }
    .onAppear {
      withAnimation(.easeIn(duration: 5)) {
        progress = 1.0
      }
      
      showTabBar()
    }
    .fullScreenCover(isPresented: $showModal) {
     CreditCenterWebView()
    }
  }
  
  private func showTabBar() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
      showModal = true
    }
  }
  
}

struct LoadView_Previews: PreviewProvider {
  static var previews: some View {
    LoadView()
  }
}
