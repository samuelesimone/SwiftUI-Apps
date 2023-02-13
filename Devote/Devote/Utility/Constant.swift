//
//  Constant.swift
//  Devote
//
//  Created by Samuele Simone on 02/02/23.
//

import SwiftUI

//MARK: - FORMATTER
private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

//MARK: - UI
var backgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomLeading)
}

//MARK: - UX
