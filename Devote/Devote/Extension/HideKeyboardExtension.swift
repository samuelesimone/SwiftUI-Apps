//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Samuele Simone on 13/02/23.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyBoard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
