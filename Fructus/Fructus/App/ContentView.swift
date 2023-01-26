//
//  ContentView.swift
//  Fructus
//
//  Created by Samuele Simone on 25/01/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTY
    var fruit: [Fruit] = fruitData
    var body: some View {
        NavigationView{
            List{
                ForEach(fruit.shuffled()) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)){
                        FruitRowView(fruit: fruit)
                            .padding(.vertical,4)
                    }
                   
                }
            }
            .navigationTitle("Fruits")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruit: fruitData)
    }
}
