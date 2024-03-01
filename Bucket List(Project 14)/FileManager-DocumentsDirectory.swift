//
//  FileManager-DocumentsDirectory.swift
//  Bucket List(Project 14)
//
//  Created by mac on 10.08.2023.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths [0]
    }
}
