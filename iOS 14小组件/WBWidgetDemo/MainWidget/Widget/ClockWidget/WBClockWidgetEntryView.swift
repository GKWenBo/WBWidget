//
//  WBClockWidgetEntryView.swift
//  MainWidgetExtension
//
//  Created by wenbo22 on 2022/11/1.
//

import SwiftUI
import Combine
import WidgetKit

struct WBClockWidgetEntryView: View {
    var entry: WBClockEntry
    
    var body: some View {
        VStack {
            WBClockView()
            Text("\(entry.date, formatter: Self.longDateFormat)")
                .font(.footnote)
                .onAppear {
                    tick()
                }
        }
        .padding(.vertical, 10)
    }
    
    func tick() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            WidgetCenter.shared.reloadAllTimelines()
            tick()
        }
    }
    
    private static let longDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }()
}

struct WBClockView: View {
    @ObservedObject var time = WBCurrentTime()
    
    var body: some View {
        ZStack {
            ForEach(0..<60) { tick in
                self.tick(at: tick)
            }
            
            WBClock(model: .init(type: .hour, timeInterval: time.seconds, tickScale: 0.4))
                .stroke(Color.primary, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle.degrees(360/60))
            
            WBClock(model: .init(type: .minute, timeInterval: time.seconds, tickScale: 0.6))
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle.degrees(360/60))
            
            WBClock(model: .init(type: .second, timeInterval: time.seconds, tickScale: 0.8))
                .stroke(Color.red, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle.degrees(360/60))
        }
        .frame(width: 100, height: 100, alignment: .center)
    }
    
    func tick(at tick: Int) -> some View {
        VStack {
            Rectangle()
                .fill(Color.primary)
                .opacity(tick % 5 == 0 ? 1 : 0.4)
                .frame(width: 2, height: tick % 5 == 0 ? 15 : 7)
            Spacer()
        }
        .rotationEffect(Angle.degrees(Double(tick) / 60 * 360))
    }
}

struct WBClock: Shape {
    var model: WBClockTickerModel
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let length = rect.width / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        path.move(to: center)
        let hoursAngle = CGFloat.pi / 2 - .pi * 2 * model.angleMultiplier
        path.addLine(to: CGPoint(x: rect.midX + cos(hoursAngle) * length * model.tickScale,
                                 y: rect.midY - sin(hoursAngle) * length * model.tickScale))
        return path
    }
}

struct WBClockWidgetEntryView_Previews: PreviewProvider {
    static var previews: some View {
        WBClockView()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
