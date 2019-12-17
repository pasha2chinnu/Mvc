//
//  HumOSError.swift
//  HumOS
//
//  Created by Nandu Ahmed on 8/30/16.
//  Copyright © 2016 Sikka Software. All rights reserved.
//

import Foundation


enum Opi9NetworkError : Error {
    case httpStatus201
    case httpStatus204
    case httpStatus400
    case httpStatus404
    case httpStatus410
    case httpStatusUnknownError
}

enum DataErrors : Error {
    case invalidJSONData
    case dataParseError
    case noData
}
