//
//  OneWordData.swift
//  WBWidgetDemo
//
//  Created by WENBO on 2022/7/2.
//

import Foundation

struct OneWord {
    let content: String
    let length: Int
}

struct OneWordLoader {
    static func fetch(completon: @escaping (Result<OneWord, Error>) -> Void) {
        let oneWordURL = URL(string: "https://v1.hitokoto.cn/")!
        let task = URLSession.shared.dataTask(with: oneWordURL) { data, response, error in
            if let error = error {
                completon(.failure(error))
                return
            }
            
            let oneWord = getOneWordInfo(fromData: data!)
            completon(.success(oneWord))
        }
        task.resume()
    }
    
    static func getOneWordInfo(fromData data: Foundation.Data) -> OneWord {
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        let content = json["hitokoto"] as! String
        let length = json["length"] as! Int
        return OneWord(content: content, length: length)
    }
}
