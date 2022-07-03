//
//  FileManager+Ext.swift
//  WBWidgetDemo
//
//  Created by WENBO on 2022/7/3.
//

import Foundation

public extension FileManager {
    static let appGroupContainerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.wb.WidgetDemo")
}
