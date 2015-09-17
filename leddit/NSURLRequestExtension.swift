//
//  NSURLRequestExtension.swift
//  leddit
//
//  Created by dev on 8/17/15.
//  Copyright © 2015 STVR. All rights reserved.
//

import Foundation

extension NSURLRequest {
    convenience init(string:String) {
        let url = NSURL(string: string)!
        self.init(URL: url)
    }
}
