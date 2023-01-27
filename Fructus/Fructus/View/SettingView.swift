//
//  SettingView.swift
//  Fructus
//
//  Created by Samuele Simone on 27/01/23.
//

import SwiftUI

struct SettingView: View {
    //MARK: - PROPERTY
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 20) {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }//: VSTACK
                .navigationTitle("Settings")
                .navigationBarItems(
                    trailing:
                        Button(action:{
                        presentationMode.wrappedValue.dismiss()
                        })
                {
                    Image(systemName: "xmark")
                }
                )
              
            }//: SCROLLVIEW
            
            
        }//: NAVIGATION
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
