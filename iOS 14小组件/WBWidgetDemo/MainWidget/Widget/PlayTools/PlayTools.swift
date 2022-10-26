//
//  PlayToos.swift
//  MainWidgetExtension
//
//  Created by WENBO on 2022/7/3.
//

import SwiftUI
import WidgetKit
import Intents

struct PlayToolsProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        return SimpleEntry(date: Date())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        let currentDate = Date()
        let entry = SimpleEntry(date: currentDate)
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

struct PlayToolsEntryView: View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: PlayToolsProvider.Entry
    @ViewBuilder
    var body: some View {
        PlayToolsMediumView()
    }
}


struct PlayToolsWidget: Widget {
    private let kind: String = WidgetKind.payToolsWidget
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind,
                            intent: ConfigurationIntent.self,
                            provider: PlayToolsProvider()) { entry in
            PlayToolsEntryView(entry: entry)
        }
                            .configurationDisplayName("支付助手")
                            .description("快捷启动扫一扫和支付码")
                            .supportedFamilies([.systemMedium])
    }
}
