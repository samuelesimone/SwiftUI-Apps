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
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 20) {
                    //MARK: - SECTION 1
                    GroupBox(
                        label: SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                    ){
                        Divider().padding(.vertical,4)
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80,height: 80)
                                .cornerRadius(9)
                            Text("I frutti sono essenziali nella nostra vita perche contegono nutrienti quali calcio,potassio, magnesio necessari per l'uomo")
                                .font(.footnote)
                               
                        }
                    }.padding()
                    //MARK: - SECTION 2
                    GroupBox(
                    label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
                    ){
                        Divider().padding(.vertical,4)
                        Text("Questa funzionalità ti permette di ripartire dalla schermata onboarding")
                            .padding(.vertical,8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                            
                        Toggle(isOn: $isOnboarding, label: {
                            Text("Restart".uppercased())
                                .padding()
                        })
                    }.padding()
                    
                    //MARK: - SECTION 3
                    GroupBox(label:
                                SettingsLabelView(labelText: "Application",labelImage: "apps.iphone"))
                            {
                                SettingsRowView(name: "Design", content: "Swift Course")
                                SettingsRowView(name: "Compatibility", content: "iOS 16")
                                SettingsRowView(name: "Website", linkLabel: "Github", linkDestination: "www.github.com/samuelesimone")
                                
                            }.padding() //BOX
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
