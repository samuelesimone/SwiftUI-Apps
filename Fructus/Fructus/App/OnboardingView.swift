//
//  OnboardingView.swift
//  Fructus
//
//  Created by Samuele Simone on 25/01/23.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: - PROPERTIES
    var fruit: [Fruit] = fruitData
    //MARK: - BODY
    var body: some View {
        TabView{
            ForEach(fruit[0...5]){
                item in
                FruitCardView(fruit: item)
            } //: LOOP
            
        }//: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical,10)
       
        
    }
}

//MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(fruit: fruitData)
    }
}
