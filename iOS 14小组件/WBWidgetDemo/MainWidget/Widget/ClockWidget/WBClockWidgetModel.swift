//
//  WBClockWidgetModel.swift
//  MainWidgetExtension
//
//  Created by wenbo22 on 2022/11/1.
//

import Foundation

struct WBClockTickerModel {
    enum WBTickerType {
        case second
        case hour
        case minute
    }
    
    let type: WBTickerType
    let timeInterval: TimeInterval
    let tickScale: CGFloat
    
    var angleMultiplier: CGFloat {
        switch type {
        case .second:
            return CGFloat(self.timeInterval.remainder(dividingBy: 60)) / 60
        case .hour:
            
        }
    }
}
