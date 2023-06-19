//
//  MFOAppApp.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 19.06.2023.
//

import SwiftUI
import AppsFlyerLib
import AppTrackingTransparency
import OneSignal

class AppDelegate: NSObject, UIApplicationDelegate, AppsFlyerLibDelegate {
  func onConversionDataSuccess(_ conversionInfo: [AnyHashable : Any]) {
    if let status = conversionInfo["af_status"] as? String {
      if (status == "Non-organic") {
        if let sourceID = conversionInfo["media_source"], let campaign = conversionInfo["campaign"] {
          print("This is a Non-organic install. Media source: \(sourceID)  Campaign: \(campaign)")
        }
      } else {
        // logic for organic install
      }
    }
  }
  
  func onConversionDataFail(_ error: Error) {
      print("error: \(error.localizedDescription)")
  }
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    print("finished lainching!")
    AppsFlyerLib.shared().appsFlyerDevKey = "A3FZNt6b2BGvpDgbzidhmf"
    AppsFlyerLib.shared().appleAppID = "MFOApp"
    AppsFlyerLib.shared().waitForATTUserAuthorization(timeoutInterval: 60)
    
    OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)
    OneSignal.initWithLaunchOptions(launchOptions)
    OneSignal.setAppId(appID)
    OneSignal.promptForPushNotifications { accepted in
      print("User accepted notification \(accepted)")
    }
    OneSignal.setExternalUserId(externalUserId, withSuccess: { results in
        print("External user id update complete with results: ", results!.description)
        if let pushResults = results!["push"] {
            print("Set external user id push status: ", pushResults)
        }
        if let emailResults = results!["email"] {
            print("Set external user id email status: ", emailResults)
        }
        if let smsResults = results!["sms"] {
            print("Set external user id sms status: ", smsResults)
        }
    }, withFailure: {error in
        print("Set external user id done with error: " + error.debugDescription)
    })
    
    return true
  }
  
  @objc func applicationDidBecomeActive(_ application: UIApplication) {
    AppsFlyerLib.shared().start()
    
    if #available(iOS 14, *) {
      ATTrackingManager.requestTrackingAuthorization { (status) in
        switch status {
        case .denied:
          print("AuthorizationSatus is denied")
        case .notDetermined:
          print("AuthorizationSatus is notDetermined")
        case .restricted:
          print("AuthorizationSatus is restricted")
        case .authorized:
          print("AuthorizationSatus is authorized")
        @unknown default:
          fatalError("Invalid authorization status")
        }
      }
    }
  }
}

@main
struct MFOAppApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  @AppStorage("firstLaunch") var firstLaunch: Bool = true
    var body: some Scene {
      WindowGroup {
        if firstLaunch {
          OnboardingView().environmentObject(OnboardingViewModel())
        } else {
         CreditCenterWebView()
        }
      }
    }
}
