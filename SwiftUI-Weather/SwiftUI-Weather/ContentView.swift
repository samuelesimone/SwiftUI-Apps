//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Samuele Simone on 01/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    @State private var infoWeather = [
        "day": "MON",
        "icon": "cloud.sun.fill",
        "tmp": 18
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack(spacing: 8){
                CityTextView(cityName: "Pescara,IT")
                ImageWeatherAndTemp(imageName:"cloud.sun.fill", temperature: 20)
                HStack(spacing: 32){
                    WeatherDayView(dayWeek: infoWeather["day"] as! String, imageDay: infoWeather["icon"] as! String, temperature: infoWeather["tmp"] as! Int)
                    WeatherDayView(dayWeek: "MAR", imageDay: "sun.max.fill", temperature: 24)
                    WeatherDayView(dayWeek: "MER", imageDay: "cloud.rain.fill", temperature: 12)
                    WeatherDayView(dayWeek: "MER", imageDay: "cloud.rain.fill", temperature: 12)
                }
                Spacer()
                ButtonWeather(textButton: "Change date", backgroundColor: .white)
                Spacer()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayWeek: String
    var imageDay: String
    var temperature: Int
    var body: some View {
        VStack(spacing:16){
            Text(dayWeek).font(.system(size: 16, weight: .regular, design: .default))
                .foregroundStyle(.white)
            Image(systemName: imageDay)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
            Text("\(temperature) °C")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        /*LinearGradient(colors: [
                                    isNight ? Color.black : Color.blue,
                                    isNight ? Color.gray : Color("lightBlue")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing
        ).ignoresSafeArea(.all)*/
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea(.all)
    }
}



struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .semibold, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct ImageWeatherAndTemp: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature) °C")
                .font(.system(size: 70, weight: .semibold))
                .foregroundStyle(.white)
            
        }.padding(.bottom,32)
    }
}


