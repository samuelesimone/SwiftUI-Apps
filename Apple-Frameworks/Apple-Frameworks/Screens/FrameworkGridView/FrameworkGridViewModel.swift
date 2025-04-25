//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Samuele Simone on 25/04/25.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject{
    var selectedFramework: Framework? {
        didSet{
            isShowingDetailView = true
        }
    }
    @Published var isShowingDetailView = false
    // Specify how many columns in the grid
    let columns: [GridItem] = [GridItem(.flexible()),
         GridItem(.flexible()),
         GridItem(.flexible())
        ] 
}
