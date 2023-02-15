//
//  MyLiveWidgetBundle.swift
//  MyLiveWidget
//
//  Created by wenbo22 on 2023/2/15.
//

import WidgetKit
import SwiftUI

@main
struct MyLiveWidgetBundle: WidgetBundle {
    var body: some Widget {
        MyLiveWidget()
        MyLiveWidgetLiveActivity()
    }
}
