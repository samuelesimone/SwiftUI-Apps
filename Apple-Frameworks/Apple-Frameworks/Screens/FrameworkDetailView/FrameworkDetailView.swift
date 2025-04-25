//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Samuele Simone on 10/04/25.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button{
                    isShowingDetailView = false
                }
                label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
                        .frame(width: 48,height: 48)
                }
            }.padding()
            
            FrameworkTitleView(framework: framework)
            ScrollView{
                Text(framework.description).padding()
            }
            AFButton(title: "Learn More")
            
        }
        
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
}
