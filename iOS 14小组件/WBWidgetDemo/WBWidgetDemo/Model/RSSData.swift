//
//  RSSData.swift
//  WBWidgetDemo
//
//  Created by WENBO on 2022/7/3.
//

import Foundation
import FeedKit

struct RSSItem {
    var title: String
    var link: String
    var description: String
    var pubDate: Date?
}

struct RSSChannel {
    var title:String
    var link:String
    var description:String
}

struct RSS {
    var url: String?
    var channel: RSSChannel?
    var items: [RSSItem]?
}

struct RSSLoader {
    static func fetch(url:String,completion: @escaping (Result<RSS, Error>) -> Void) {
        var rss = RSS(url: url)
        let feedURL = URL(string: url)!
        let parser = FeedParser(URL: feedURL)
        let result = parser.parse()
        switch result {
        case .success(let feed):
            // Grab the parsed feed directly as an optional rss, atom or json feed object
//            feed.rssFeed
            // Or alternatively...
            switch feed {
            case let .rss(feed):
                // Really Simple Syndication Feed Model
                let channel = RSSChannel(title: feed.title ?? "title", link: feed.link ?? "link", description: feed.description ?? "desc")
                var items:[RSSItem]? = []
                for feedItem in feed.items ?? [] {
                    let item = RSSItem(title: feedItem.title ?? "title", link: feedItem.link ?? "link", description: feedItem.description ?? "desc", pubDate: feedItem.pubDate)
                    items?.append(item)
                }
                rss.items = items
                rss.channel = channel
                completion(.success(rss))
                break
            default:
                completion(.success(rss))
            }
        case .failure(let error):
            completion(.failure(error))
        }
        
    }
}
