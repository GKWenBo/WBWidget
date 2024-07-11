//
//  View+Ex.swift
//  WBWidgetDemo
//
//  Created by wenbo22 on 2024/7/10.
//

import SwiftUI


extension View {
    @ViewBuilder
    func widgetBackground(_ backGroundView: some View = Color.clear) -> some View {
        if #available(iOS 17.0, *) {
            containerBackground(for: .widget) {
                backGroundView
            }
        } else {
            background {
                backGroundView
            }
        }
    }
}
