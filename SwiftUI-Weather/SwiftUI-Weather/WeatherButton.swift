//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Samuele Simone on 02/04/25.
//

import Foundation
import SwiftUI


struct ButtonWeather: View {
    var textButton: String
    var backgroundColor: Color
    var body: some View {
        Button{
            //isNight.toggle()
        }label: {
            Text(textButton)
                .frame(width:280,height:50)
                .background(backgroundColor)
                .font(.system(size: 20, weight: .semibold))
                .clipShape(.rect(cornerRadius: 8))
            
        }
    }
}
