//
//  OnboardingViewModel.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 19.06.2023.
//

import Foundation
import AppsFlyerLib

final class OnboardingViewModel: ObservableObject {
  let onboardingSteps = DescriptionStep.allCases
  @Published var currentStep = 0
  @Published var started = false
  

  
  func skipDidTap() {
    currentStep = onboardingSteps.count - 1
  }
  
  func continueText() -> String {
    if currentStep < onboardingSteps.count - 1 {
      return "Пропустить"
    } else {
      return "Все понятно"
    }
  }
  
  func continueDidTap() {
    if currentStep < onboardingSteps.count - 1 {
      currentStep += 1
    } else {
      AppsFlyerLib.shared().logEvent(name: "onboarding_Comleted", values: [AFEventParamCustomerUserId: externalUserId])
      started.toggle()
    }
  }
}
