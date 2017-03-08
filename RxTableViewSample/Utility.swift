//
//  Utility.swift
//  RxTableViewSample
//
//  Created by Ranjeet on 02/03/17.
//  Copyright © 2017 Ranjeet. All rights reserved.
//

import UIKit

protocol Serialize {
    associatedtype type
    static func serializer(json:AnyObject) -> type?
}

class Utility: NSObject {

}
