//
//  FructusApp.swift
//  Fructus
//
//  Created by Samuele Simone on 25/01/23.
//

import SwiftUI

@main
struct FructusApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            }else{
                ContentView()
            }
          
        }
    }
}
