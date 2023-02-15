//
//  ViewController.swift
//  WBLiveActivityUpdateDemo
//
//  Created by wenbo22 on 2023/2/15.
//

import UIKit
import ActivityKit

class ViewController: UIViewController {
    
    private var activity: Activity<MyLiveWidgetAttributes>? = nil
    var imageName = "1"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func endAction(_ sender: Any) {
        let contentState = MyLiveWidgetAttributes.ContentState(imageName: self.imageName)
        Task {
            Task{
                await activity?.end(using: contentState, dismissalPolicy: .immediate)
            }
        }
    }
    
    @IBAction func updateAction(_ sender: Any) {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { time in
            guard let activity = self.activity else {
                return
            }
            
            if self.imageName == "1" {
                self.imageName = "2";
            } else {
                self.imageName = "1";
            }
            
            let contentState = MyLiveWidgetAttributes.ContentState(imageName: self.imageName)
            
            Task {
                await activity.update(using: contentState)
            }
        }
    }
    
    @IBAction func startAction(_ sender: Any) {
        let attribute = MyLiveWidgetAttributes(name: "start")
        let contentState = MyLiveWidgetAttributes.ContentState(imageName: imageName)
        
        activity = try? Activity<MyLiveWidgetAttributes>.request(attributes: attribute, contentState: contentState, pushType: nil)
    }
}

