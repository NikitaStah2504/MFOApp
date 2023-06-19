//
//  WebModel.swift
//  MFOApp
//
//  Created by Nikita Stshovsky on 19.06.2023.
//

import Foundation

let appName = "MFOApplication"
let appsFlyerDevKey: String = "A3FZNt6b2BGvpDgbzidhmf"
let oneSignalKey: String = ""
let appID: String = "dfb3af77-3281-4189-a322-0149666f582d"
let externalUserId = UUID_

var UUID_ : String {
    get {
        if UserDefaults.standard.object(forKey: "UUID") == nil{
            UserDefaults.standard.set("\(UUID())", forKey: "UUID")
        }
        return UserDefaults.standard.object(forKey: "UUID") as! String
    }
}

var appsID: String {
    get {
        return UserDefaults.standard.object(forKey: "appsID") as? String ?? ""
    } set {
        UserDefaults.standard.set(newValue, forKey: "appsID")
    }
}
