//
//   MyLiveWidgetLiveModel.swift
//  WBLiveActivityUpdateDemo
//
//  Created by wenbo22 on 2023/2/16.
//

import Foundation

class MyLiveWidgetLiveModel: ObservableObject {
    @Published var imageName = "1"
    var timer: DispatchSourceTimer!
    
    func start() {
        let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.main)
        timer.schedule(deadline: .now(), repeating: .seconds(1))
        timer.setEventHandler {
            if self.imageName == "1" {
                self.imageName = "2"
            } else {
                self.imageName = "1"
            }
        }
        timer.resume()
        self.timer = timer
    }
}
