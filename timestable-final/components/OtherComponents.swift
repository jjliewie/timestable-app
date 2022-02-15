//
//  OtherComponents.swift
//  timestable-final
//
//  Created by Julie Rhee on 2/4/22.
//

import SwiftUI

extension Double {
    func round(nearest: Double) -> Double {
        let n = 1/nearest
        let numberToRound = self * n
        return numberToRound.rounded() / n
    }

    func floor(nearest: Double) -> Double {
        let intDiv = Double(Int(self / nearest))
        return intDiv * nearest
    }
}


