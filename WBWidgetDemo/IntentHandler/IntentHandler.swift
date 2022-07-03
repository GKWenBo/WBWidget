//
//  IntentHandler.swift
//  IntentHandler
//
//  Created by WENBO on 2022/7/3.
//

import Intents

// As an example, this class is set up to handle Message intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Send a message using <myApp>"
// "<myApp> John saying hello"
// "Search for messages in <myApp>"

class IntentHandler: INExtension, DynamicPersonSelectionIntentHandling {
    func providePersonOptionsCollection(for intent: DynamicPersonSelectionIntent, with completion: @escaping (INObjectCollection<Person>?, Error?) -> Void) {
        let persons = Contact.getAll()
            .map {
                Person(identifier: $0.id, display: $0.name)
            }
        let collection = INObjectCollection(items: persons)
        completion(collection, nil)
    }
}
