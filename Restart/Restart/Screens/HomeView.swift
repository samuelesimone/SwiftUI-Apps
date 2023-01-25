//
//  HomeView.swift
//  Restart
//
//  Created by Samuele Simone on 19/01/23.
//

import SwiftUI

struct HomeView: View {
//  MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActiveBool: Bool = false
    @State private var isAnimated: Bool = false
//  MARK: - BODY
    var body: some View {
        VStack(spacing:20) {
            // MARK: - HEADER
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimated ? 35: -35)
                    .animation(
                        Animation.easeInOut(duration: 4)
                        .repeatForever(),
                        value: isAnimated
                    )
            }
            //MARK: - CENTER
            
            Text("Il tempo necessario per padroneggiare una materia dipende da quanto ti impegni")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            //MARK: - FOOTER
            Spacer()
        
            Button(action:{
                withAnimation{
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActiveBool = true
                }
        
            }){
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }.buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                
            
        }//: VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                isAnimated = true
            })
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
