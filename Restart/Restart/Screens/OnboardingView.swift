//
//  OnboardingView.swift
//  Restart
//
//  Created by Samuele Simone on 19/01/23.
//

import SwiftUI

struct OnboardingView: View {
//    MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActiveBool: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimated: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "Share."
    
    let hapticFeedback = UINotificationFeedbackGenerator()
//    MARK: - BODY
    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(
                .all, edges: .all)
            VStack (spacing: 20){
                //MARK: - HEADER
                Spacer()
                VStack(spacing: 0){
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(textTitle)
                    
                    Text("""
                        Non è importante quanto diamo
                        ma quanto amore ci mettiamo
                    """).font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,10)
                }
                .opacity(isAnimated ? 1 : 0)
                .offset(y: isAnimated ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimated)
                //MARK: - CENTER
                ZStack(){
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimated ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimated)
                        .offset(x: imageOffset.width * 1.2, y:0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged{
                                    gesture in
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                        withAnimation(.linear(duration: 0.25)){
                                            indicatorOpacity = 0
                                            textTitle = "Give."
                                        }
                                    }
                                }
                                .onEnded({_ in
                                    imageOffset = .zero
                                    withAnimation(.linear(duration: 0.25)){
                                        indicatorOpacity = 1
                                        textTitle = "Share."
                                    }
                                })
                        ).animation(.easeOut(duration: 1), value: imageOffset)
                            
                        
                }
                .overlay(Image(systemName: "arrow.left.and.right.circle")
                .font(.system(size: 44, weight: .ultraLight))
                .foregroundColor(.white)
                .offset(y:20)
                .opacity(isAnimated ? 1: 0)
                .animation(.easeOut(duration: 1).delay(2), value: isAnimated)
                .opacity(indicatorOpacity)
                , alignment: . bottom
                         )
                Spacer()
                //MARK: - FOOTER
                ZStack{
                    // 1. BACKGROUND
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. CALL-TO-ACTION Static
                    Text("Iniziamo")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x:20)
                    // 3. Capsule Dynamic
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    // 4. Circle draggable
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName:"chevron.right.2")
                                .font(.system(size:24 , weight: .bold
                                        ))
                                
                        }.foregroundColor(.white)
                            .frame(width: 80,height: 80,alignment: .center)
                            .offset(x: buttonOffset)
                            .gesture(DragGesture()
                                .onChanged{gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                    
                                }
                                .onEnded{ _ in
                                    withAnimation(.linear(duration: 0.25)){
                                        if buttonOffset > buttonWidth/2 {
                                            hapticFeedback.notificationOccurred(.success)
                                            playSound(sound: "chimeup", type: "mp3")
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActiveBool = false
                                        }else{
                                            buttonOffset = 0
                                            hapticFeedback.notificationOccurred(.warning)
                                        }
                                    }
                                    
                                }
                            ) //: GESTURE
                            
                        Spacer()
                    }
                }
                .frame(width: buttonWidth ,height: 80, alignment: .center)
                .padding()
                .opacity(isAnimated ? 1 : 0)
                .offset(y: isAnimated ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimated)
            
            }//: VSTACK
        }.zIndex(1) //: ZSTACK
        .onAppear(perform: {
            isAnimated = true
        })
        .preferredColorScheme(.dark)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
