//
//  SelectPersonIntent.swift
//  WBWidgetDemo
//
//  Created by wenbo22 on 2024/7/11.
//

import AppIntents
import WidgetKit

struct DynamicSimpleEntry: TimelineEntry {
    let date: Date
    var contact: Contact?
}

// MARK: - AppIntent
@available(iOS 17, *)
struct SelectPersonIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Select Person"
    static var description: IntentDescription = IntentDescription("Select Person")
    
    @Parameter(title: "Person1")
    var person1: Contact?
    
    @Parameter(title: "Person2")
    var person2: Contact?
    
    @Parameter(title: "Person Switch", default: true)
    var isOn: Bool
    
}

@available(iOS 17, *)
struct SelectPersonQuery: EntityStringQuery {
    typealias Entity = Contact
    
    func entities(matching string: String) async throws -> [Entity] {
        Contact.getAll().filter {
            $0.name.lowercased().contains(string.lowercased())
        }
    }
    
    func entities(for identifiers: [String]) async throws -> [Contact] {
        Contact.getAll().filter {
            identifiers.contains($0.id)
        }
    }
    
    /// 弹出编辑页面，获取展示数据时调用
    /// - Returns: 要展示的数据
    func suggestedEntities() async throws -> [Contact] {
        Contact.getAll()
    }
}

@available(iOS 17, *)
struct AppIntentProvider: AppIntentTimelineProvider {
    typealias Entry = DynamicSimpleEntry
    typealias Intent = SelectPersonIntent
    
    func placeholder(in context: Context) -> DynamicSimpleEntry {
        DynamicSimpleEntry(date: Date(), contact: .friend1)
    }
    
    func snapshot(for configuration: SelectPersonIntent, in context: Context) async -> DynamicSimpleEntry {
        let entry = DynamicSimpleEntry(date: Date(), contact: .friend1)
        return entry
    }
    
    func timeline(for configuration: SelectPersonIntent, in context: Context) async -> Timeline<DynamicSimpleEntry> {
        let entries = [DynamicSimpleEntry(date: Date(), contact: contact(for: configuration))]
        let timeline = Timeline(entries: entries, policy: .never)
        return timeline
    }
    
    func contact(for intent: SelectPersonIntent) -> Contact? {
        if let id = intent.person1?.id, let contact = Contact.fromId(id) {
            return contact
        } else if let id = intent.person2?.id, let contact = Contact.fromId(id) {
            return contact
        }
        return nil
    }
}
