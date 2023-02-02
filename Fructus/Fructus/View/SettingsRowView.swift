//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Samuele Simone on 02/02/23.
//

import SwiftUI

struct SettingsRowView: View {
    var name: String
    var content: String? = nil
    var linkLabel: String? =  nil
    var linkDestination: String? =  nil
    
    var body: some View {
        VStack {
            Divider().padding(.vertical,4)
            HStack(){
                Text(name).foregroundColor(.gray)
                Spacer()
                if (content != nil) {
                    Text(content!)
                } else if(linkLabel != nil && linkDestination != nil){
                    Link(linkLabel!,
                         destination:
                            URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
            
                }else{
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
            }
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(name: "Developer", content: "Samuele Simone")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
