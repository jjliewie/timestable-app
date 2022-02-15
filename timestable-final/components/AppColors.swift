//
//  AppColors.swift
//  timestable-final
//
//  Created by Julie Rhee on 2/4/22.
//

import SwiftUI

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

extension Color {
    
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    
    static let gradColor_pink = LinearGradient(Color("peach"), Color("salmon"))
    
    static let gradColor_blue = LinearGradient(Color("grey"), Color("seaFoam"))
    
    static let gradColor_lightPink = LinearGradient(Color("lighterPink"), Color("pink"))
    
    static let gradColor_bluePink = LinearGradient(Color("pink"), Color("powderBlue"))
    
    static let gradColor_green = LinearGradient(Color("lightTeal"), Color("greenFoam"))
    
    static let gradColor_yellow = LinearGradient(Color("yellow1"), Color("yellow2"))
    
    static let gradColor_powderPink = LinearGradient(Color("powderPink"), Color("pink"))
    
    static let gradColor_powderBlue = LinearGradient(Color("powderBlue"), Color("newBlue"))
}

