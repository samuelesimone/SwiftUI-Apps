//
//  FrameworkTitleView.swift
//  Apple-Frameworks
//
//  Created by Samuele Simone on 25/04/25.
//

import SwiftUI

struct FrameworkTitleView: View {
    let framework: Framework
    var body: some View{
        VStack{
            Image(framework.imageName)
                .resizable()
                .frame(width: 90,height: 90, alignment: .center)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }.padding()
    }
    
    
}

#Preview {
    FrameworkTitleView(framework: MockData.sampleFramework)
}
