//
//  AFButton.swift
//  Apple-Frameworks
//
//  Created by Samuele Simone on 10/04/25.
//

import SwiftUI

struct AFButton: View {
    let title: String
    var body: some View {
        Button {
            
        } label: {
            Text(title)
        }.font(.title2)
            .fontWeight(.semibold)
            .frame(width: 200, height: 50)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(12)
            
    
    }
}

#Preview {
    AFButton(title: "ciao")
}
