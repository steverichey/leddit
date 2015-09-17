//
//  Story.swift
//  leddit
//
//  Created by dev on 8/17/15.
//  Copyright © 2015 STVR. All rights reserved.
//

import Foundation

enum VoteStatus : Int {
    case None = 0
    case Up = 1
    case Down = 2
}

struct Story {
    let author:String
    let comments:Int
    let domain:String
    let id:String
    let score:Int
    let subreddit:String
    let title:String
    let url:String
    let vote:VoteStatus
}
