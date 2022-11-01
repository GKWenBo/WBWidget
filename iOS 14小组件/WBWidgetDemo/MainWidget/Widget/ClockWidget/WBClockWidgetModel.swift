//
//  WBClockWidgetModel.swift
//  MainWidgetExtension
//
//  Created by wenbo22 on 2022/11/1.
//

import Foundation
import SwiftUI
import Combine

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
            return CGFloat(timeInterval / 3600) / 12
        case .minute:
            return CGFloat((timeInterval - Double(Int(timeInterval / 3600) * 3600)) / 60) / 60
        }
    }
    
    var tickerScale: CGFloat {
        switch type {
        case .hour:
            return 0.4
        case .minute:
            return 0.6
        case .second:
            return 0.8
        }
    }
}

final class WBCurrentTime: ObservableObject {
    @Published var seconds: TimeInterval = WBCurrentTime.currentSecond(date: Date())

    private let timer = Timer.publish(every: 0.2, on: .main, in: .default).autoconnect()
    private var store = Set<AnyCancellable>()

    init() {
        timer.map(Self.currentSecond).assign(to: \.seconds, on: self).store(in: &store)
    }

    private static func currentSecond(date: Date) -> TimeInterval {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        let referenceDate = Calendar.current.date(from: DateComponents(year: components.year!, month: components.month!, day: components.day!))!
        return Date().timeIntervalSince(referenceDate)
    }
}
