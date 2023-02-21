//
//  SwiftUIView.swift
//  WBLiveActivityUpdateDemo
//
//  Created by wenbo22 on 2023/2/21.
//

import SwiftUI

struct SwiftUIView: View {
    @State var index = 0
    
    var body: some View {
        ZStack {
            TimelineView(.periodic(from: .now, by: 1.0)) { ctx in
                Text("\(ctx.date)")
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
