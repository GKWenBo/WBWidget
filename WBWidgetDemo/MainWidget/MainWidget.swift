//
//  MainWidget.swift
//  MainWidget
//
//  Created by WENBO on 2022/7/3.
//

import WidgetKit
import SwiftUI
import Intents

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct PlaceholderView : View {
    //这里是PlaceholderView - 提醒用户选择部件功能
    var body: some View {
        Text("Place Holder")
    }
}

@main
struct Widgets: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        PlayToolsWidget()
        DynamicIntentWidget()
    }
}

struct MainWidget_Previews: PreviewProvider {
    static var previews: some View {
        PlayToolsEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
