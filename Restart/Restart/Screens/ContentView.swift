//
//  ContentView.swift
//  Restart
//
//  Created by Samuele Simone on 19/01/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActiveBool = true
    var body: some View {
        ZStack{
            if isOnboardingViewActiveBool {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
