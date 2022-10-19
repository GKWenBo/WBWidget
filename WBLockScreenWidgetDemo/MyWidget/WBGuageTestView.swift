//
//  WBGuageTestView.swift
//  MyWidgetExtension
//
//  Created by wenbo22 on 2022/10/19.
//

import SwiftUI

struct WBGuageTestView: View {
    @State private var progress = 0.5
    @State private var currentSpeed = 50.0
    
    var body: some View {
        ScrollView {
            VStack {
                /// eg1：base use
                Gauge(value: progress) {
                    Text("Upload Status")
                }
                
                
                /// eg2:
                Gauge(value: progress) {
                    Text("Upload Status")
                } currentValueLabel: {
                    Text(progress.formatted(.percent))
                } minimumValueLabel: {
                    Text(0.formatted(.percent))
                } maximumValueLabel: {
                    Text(100.formatted(.percent))
                }
                
                
                /// eg3：using custom range
                Gauge(value: currentSpeed, in: 0...200) {
                    Text("Upload Status")
                } currentValueLabel: {
                    Text("\(currentSpeed.formatted(.number))km/h")
                } minimumValueLabel: {
                    Text(0.formatted(.number))
                } maximumValueLabel: {
                    Text(200.formatted(.number))
                }
                
                
                /// eg4：using image labels
                Gauge(value: currentSpeed, in: 0...200) {
                    Image(systemName: "gauge.medium")
                        .font(.system(size: 50.0))
                } currentValueLabel: {
                    HStack {
                        Image(systemName: "gauge.high")
                        Text("\(currentSpeed.formatted(.number))km/h")
                    }
                } minimumValueLabel: {
                    Text(0.formatted(.number))
                } maximumValueLabel: {
                    Text(200.formatted(.number))
                }
                
                
                /// eg5: customizing the gauge style
                Gauge(value: currentSpeed, in: 0...200) {
                    Image(systemName: "gauge.medium")
                        .font(.system(size: 50.0))
                } currentValueLabel: {
                    HStack {
                        Image(systemName: "gauge.high")
                        Text("\(currentSpeed.formatted(.number))km/h")
                    }
                } minimumValueLabel: {
                    Text(0.formatted(.number))
                } maximumValueLabel: {
                    Text(200.formatted(.number))
                }
                .tint(.orange)
                
                
                /// eg6: gaugeStyle = accessoryLinear
                Gauge(value: currentSpeed, in: 0...200) {
                    Image(systemName: "gauge.medium")
                        .font(.system(size: 50.0))
                } currentValueLabel: {
                    HStack {
                        Image(systemName: "gauge.high")
                        Text("\(currentSpeed.formatted(.number))km/h")
                    }
                } minimumValueLabel: {
                    Text(0.formatted(.number))
                } maximumValueLabel: {
                    Text(200.formatted(.number))
                }
                .gaugeStyle(.accessoryLinear)
                
                
                /// eg7: gaugeStyle = accessoryLinearCapacity
                Gauge(value: currentSpeed, in: 0...200) {
                    Image(systemName: "gauge.medium")
                        .font(.system(size: 50.0))
                } currentValueLabel: {
                    HStack {
                        Image(systemName: "gauge.high")
                        Text("\(currentSpeed.formatted(.number))km/h")
                    }
                } minimumValueLabel: {
                    Text(0.formatted(.number))
                } maximumValueLabel: {
                    Text(200.formatted(.number))
                }
                .gaugeStyle(.accessoryLinearCapacity)
                
                
                /// eg8: gaugeStyle = accessoryCircular
                Gauge(value: currentSpeed, in: 0...200) {
                    Image(systemName: "gauge.medium")
                        .font(.system(size: 50.0))
                } currentValueLabel: {
                    Text("\(currentSpeed.formatted(.number))km/h")
                } minimumValueLabel: {
                    Text(0.formatted(.number))
                } maximumValueLabel: {
                    Text(200.formatted(.number))
                }
                .gaugeStyle(.accessoryCircular)
                
                /// eg9: gaugeStyle = accessoryCircular
                Gauge(value: currentSpeed, in: 0...200) {
                    Image(systemName: "gauge.medium")
                        .font(.system(size: 50.0))
                } currentValueLabel: {
                    Text("\(currentSpeed.formatted(.number))km/h")
                } minimumValueLabel: {
                    Text(0.formatted(.number))
                } maximumValueLabel: {
                    Text(200.formatted(.number))
                }
                .gaugeStyle(.accessoryCircularCapacity)
                .tint(.yellow)
                
                /// eg10: custom gauge view
                Gauge(value: currentSpeed, in: 0...200) {
                    Image(systemName: "gauge.medium")
                                    .font(.system(size: 50.0))
                } currentValueLabel: {
                    Text("\(currentSpeed.formatted(.number))")
                }
                .gaugeStyle(CustomGaugeStyle())
            }
            .padding()
        }
    }
}

struct CustomGaugeStyle: GaugeStyle {
    private var purpleGradient = LinearGradient(gradient: Gradient(colors: [ Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255, blue: 179/255) ]), startPoint: .trailing, endPoint: .leading)
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .foregroundColor(Color(.systemGray6))
            
            Circle()
                .trim(from: 0, to: 0.75 * configuration.value)
                .stroke(purpleGradient, lineWidth: 20)
                .rotationEffect(.degrees(135))
            
            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(Color.black, style: StrokeStyle(lineWidth: 10, lineCap: .butt, lineJoin: .round, dash: [1, 34], dashPhase: 0.0))
                .rotationEffect(.degrees(135))
            
            VStack {
                configuration.currentValueLabel
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .foregroundColor(.gray)
                Text("KM/H")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .foregroundColor(.gray)
            }
        }
        .frame(width: 300, height: 300)
    }
}

struct WBGuageTestView_Previews: PreviewProvider {
    static var previews: some View {
        WBGuageTestView()
            .previewDevice("iPhone 14 Pro")
    }
}
