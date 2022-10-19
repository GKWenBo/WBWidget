//
//  WBProgressViewTest.swift
//  WBLockScreenWidgetDemo
//
//  Created by wenbo22 on 2022/10/19.
//

import SwiftUI

struct WBProgressViewTest: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 30) {
                /// eg1
                ProgressView()
                
                /// eg2
                ProgressView("Loading")
                
                /// eg3：Determinate progress
                ProgressView(value: 250, total: 1000)
                
                /// eg4
                ProgressView(value: 0.7){
                    Image(systemName :"music.note")
                }
                .progressViewStyle(.circular)
            }
            .padding()
        }
    }
}

struct WBProgressViewTest_Previews: PreviewProvider {
    static var previews: some View {
        WBProgressViewTest()
    }
}
