//
//  MyLiveWidgetLiveActivity.swift
//  MyLiveWidget
//
//  Created by wenbo22 on 2023/2/15.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MyLiveWidgetAttributes: ActivityAttributes {    
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var imageName: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct MyLiveWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MyLiveWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
//                Image(context.state.imageName)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
                AnimatedImage(name: "test.gif")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("Min")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

struct MyLiveWidgetLiveActivity_Previews: PreviewProvider {
    static let attributes = MyLiveWidgetAttributes(name: "Me")
    static let contentState = MyLiveWidgetAttributes.ContentState(imageName: "1")

    static var previews: some View {
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
            .previewDisplayName("Island Compact")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
            .previewDisplayName("Island Expanded")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
            .previewDisplayName("Minimal")
        attributes
            .previewContext(contentState, viewKind: .content)
            .previewDisplayName("Notification")
    }
}
