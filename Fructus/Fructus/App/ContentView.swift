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
    @State private var isShowingSettings: Bool = false
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
            .navigationBarItems(
                trailing:
                    Button(action:{
                        isShowingSettings = true
                    }){
                        Image(systemName: "slider.horizontal.3")
                    }
                    .sheet(isPresented: $isShowingSettings){
                        SettingView()
                    }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruit: fruitData)
    }
}
