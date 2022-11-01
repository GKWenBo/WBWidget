//
//  WBClockWidget.swift
//  MainWidgetExtension
//
//  Created by wenbo22 on 2022/11/1.
//

import WidgetKit
import SwiftUI
import Intents

struct WBClockEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct WBClockProvider: IntentTimelineProvider {
    typealias Entry = WBClockEntry
    typealias Intent = ConfigurationIntent
    
    func placeholder(in context: Context) -> WBClockEntry {
        WBClockEntry(date: Date(), configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (WBClockEntry) -> Void) {
        completion(WBClockEntry(date: Date(), configuration: ConfigurationIntent()) )
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<WBClockEntry>) -> Void) {
        var entries: [WBClockEntry] = []

        let currentDate = Date()
        let entry = WBClockEntry(date: currentDate, configuration: configuration)
        entries.append(entry)

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct WBClockWidget: Widget {
    let kind = "WBClockWidget"
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind,
                            intent: ConfigurationIntent.self,
                            provider: WBClockProvider()) { entry in
            WBClockWidgetEntryView(entry: entry)
        }
                            .configurationDisplayName("WBClockWidget")
                            .description("This is an example widget.")
    }
}


struct LexClockWidget_Previews: PreviewProvider {
    static var previews: some View {
        WBClockWidgetEntryView(entry: WBClockEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
