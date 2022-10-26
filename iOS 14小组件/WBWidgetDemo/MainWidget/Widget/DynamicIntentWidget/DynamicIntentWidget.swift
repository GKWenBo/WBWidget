//
//  DynamicIntentWidget.swift
//  MainWidgetExtension
//
//  Created by WENBO on 2022/7/3.
//

import SwiftUI
import WidgetKit

private struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> DynamicSimpleEntry {
        DynamicSimpleEntry(date: Date(), contact: .friend1)
    }
    
    func getSnapshot(for configuration: DynamicPersonSelectionIntent, in context: Context, completion: @escaping (DynamicSimpleEntry) -> Void) {
        let entry = DynamicSimpleEntry(date: Date(), contact: .friend1)
        completion(entry)
    }
    
    func getTimeline(for configuration: DynamicPersonSelectionIntent, in context: Context, completion: @escaping (Timeline<DynamicSimpleEntry>) -> Void) {
        let entries = [DynamicSimpleEntry(date: Date(), contact: contact(for: configuration))]
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
    
    func contact(for configuration: DynamicPersonSelectionIntent) -> Contact? {
        if let id = configuration.person?.identifier, let contact = Contact.fromId(id) {
            return contact
        }
        return nil
    }
}

private struct DynamicSimpleEntry: TimelineEntry {
    let date: Date
    var contact: Contact?
}

private struct DynamicIntentWidgetEntryView: View {
    var entry: Provider.Entry
    
    @ViewBuilder
    var body: some View {
        if let contact = entry.contact {
            contactView(for: contact)
        } else {
            Text("Choose contact")
        }
    }
    
    func contactView(for contact: Contact) -> some View {
        VStack {
            Text(contact.name)
                .fontWeight(.semibold)
            Group {
                Text("Date of birth:")
                Text(contact.dateOfBirth, style: .date)
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct DynamicIntentWidget: Widget {
    let kind: String = WidgetKind.dynamicIntent
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind,
                            intent: DynamicPersonSelectionIntent.self,
                            provider: Provider()) { entry in
            DynamicIntentWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Dynamic Intent Widget")
        .description("A Widget that has dynamically configurable data.")
        .supportedFamilies([.systemSmall])
    }
}

struct DynamicIntentWidget_Previews: PreviewProvider {
    static var previews: some View {
        DynamicIntentWidgetEntryView(entry: DynamicSimpleEntry(date: Date(), contact: .friend1))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
