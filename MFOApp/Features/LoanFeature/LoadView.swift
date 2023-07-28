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
  @StateObject var viewModel: LoanViewModel
  
  let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
  
  var body: some View {
    ZStack {
      Color.white
        .ignoresSafeArea()
      VStack {
        ZStack {
          Text("\(procentProgress)%")
            .font(.system(size: 21, weight: .medium))
            .foregroundColor(Color.black)
            .onReceive(timer) { _ in
              if timeRemaining > 0 {
                procentProgress += 2
                timeRemaining -= 1
              }
            }
          Circle()
            .stroke(
              Color.black,
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
        }.frame(width: 120, height: 120)
        Text("loadText")
          .font(.system(size: 21, weight: .medium))
          .foregroundColor(.black)
          .padding()
      }
      .onDisappear {
        UserDefaults.standard.set(false, forKey: "firstLaunch")
      }
    }
    .task {
      withAnimation(.easeIn(duration: 5)) {
        progress = 1.0
      }
    }
    .fullScreenCover(isPresented: $viewModel.showModal) {
      LoanListView().environmentObject(LoanViewModel())
    }
  }
}
