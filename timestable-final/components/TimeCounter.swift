//
//  TimeCounter.swift
//  timestable-final
//
//  Created by Julie Rhee on 2/4/22.
//

import SwiftUI

// time counter
class TimeCounter: ObservableObject {
    @Published var time = 0.0
    
    lazy var timer = Timer()
    
    func start(){
        
        time = 0.0
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.time = self.time + 0.1
        }
    }
    
    func stop() {
        timer.invalidate()
        time = 0.0
    }
    
    func pause() {
        timer.invalidate()
    }

    init() {
        start()
        
    }
}
