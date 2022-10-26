//
//  ContentView1.swift
//  WBWidgetDemo
//
//  Created by WENBO on 2022/7/3.
//

import SwiftUI
import WidgetKit

struct ContentView1: View {
    
    @State private var contacts = Contact.getAll()
    var body: some View {
        List {
            dynamicIntentWidgetSection
        }
        .listStyle(InsetGroupedListStyle())
    }
}

extension ContentView1 {
    private var dynamicIntentWidgetSection: some View {
        Section(header: Text("Dynamic Intent Widget")) {
            ForEach(contacts.indices, id: \.self) { index in
                HStack {
                    TextField("", text: $contacts[index].name) {
                        saveContacts()
                    }
                    DatePicker("", selection: $contacts[index].dateOfBirth, displayedComponents: .date)
                        .onChange(of: contacts[index].dateOfBirth) { _ in
                            saveContacts()
                        }
                }
            }
        }
    }
    
    private func saveContacts() {
        let key = UserDefaults.Keys.contacts.rawValue
        UserDefaults.appGroup.setArray(contacts, forKey: key)
        WidgetCenter.shared.reloadTimelines(ofKind: WidgetKind.dynamicIntent)
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
