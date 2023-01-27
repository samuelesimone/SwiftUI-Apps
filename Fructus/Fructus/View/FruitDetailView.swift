//
//  FruitDetailView.swift
//  Fructus
//
//  Created by Samuele Simone on 26/01/23.
//

import SwiftUI

struct FruitDetailView: View {
    var fruit: Fruit
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .center, spacing: 20){
                    // HEADER
                    FruitHeaderView(fruit: fruit)
                    VStack(alignment:.leading, spacing: 20) {
                        // TITLE
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors[1])
                        // HEADLINE
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.accentColor)
                        // NUTRIENTS
                        FruitNutrientsView(fruit: fruit)
                        
                        // SUBHEADLINE
                        Text("Learn more about \(fruit.title)".uppercased())
                            .fontWeight(.bold)
                        // DESCRIPTION
                        Text(fruit.description)
                            .foregroundColor(Color.accentColor)
                            .multilineTextAlignment(.leading)
                        // LINK
                        SourceLinkView()
                            .padding(.top,10)
                            .padding(.bottom,40)
                    }.padding(.horizontal,20)
                        .frame(maxWidth: 640,alignment: .center)
                        .foregroundColor(fruit.gradientColors[1])
                }// VSTACK
                .navigationBarTitle(fruit.title,displayMode: .inline)
                    .navigationBarHidden(true)
            }// VSTACK
            .edgesIgnoringSafeArea(.top)
        }
      
        // NAVIGATION
    }
}

struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitData[0])
    }
}
