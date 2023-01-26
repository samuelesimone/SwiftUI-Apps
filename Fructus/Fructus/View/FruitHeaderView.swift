//
//  FruitHeaderView.swift
//  Fructus
//
//  Created by Samuele Simone on 26/01/23.
//

import SwiftUI

struct FruitHeaderView: View {
    var fruit: Fruit
    @State private var isAnimatingImage: Bool = false
    var body: some View {
        ZStack {
            LinearGradient(colors: fruit.gradientColors, startPoint: .topLeading, endPoint: .bottomLeading)
            Image(fruit.image)
                .renderingMode(.original)
                .resizable()
            .scaledToFit()
            .shadow(color:Color(red:0,green:0,blue:0,opacity: 0.15),radius: 8,x:6,y:8)
            .padding(.vertical,20)
            .scaleEffect(isAnimatingImage ? 1 : 0.6)
            .onAppear(){
                withAnimation(.easeOut(duration: 0.5)){
                    isAnimatingImage = true
                }
            }
        }.frame(height: 440)
    }
}

struct FruitHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FruitHeaderView(fruit: fruitData[1])
            .previewLayout(.fixed(width:375, height:440))
    }
}
