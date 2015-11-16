//
//  FourLines.swift
//  ios-persistence
//
//  Created by Xiao Lu on 11/15/15.
//  Copyright © 2015 Xiao Lu. All rights reserved.
//

import Foundation

class FourLines: NSObject, NSCoding, NSCopying {
    var lines:[String]?
    let linesKey = "linesKey"
    
    override init() {
    }
    
    required init(coder decoder:NSCoder) {
        lines = decoder.decodeObjectForKey(linesKey) as? [String]
    }
    
    func encodeWithCoder(coder: NSCoder) {
        if let saveLines = lines {
            coder.encodeObject(saveLines, forKey: linesKey)
        }
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = FourLines()
        if let linesToCopy = lines {
            var newLines = Array<String>()
            for line in linesToCopy {
                newLines.append(line)
            }
            copy.lines = newLines
        }
        return copy
    }
}