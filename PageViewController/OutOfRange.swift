//
//  OutOfRange.swift
//  SistaCafe
//
//  Created by Sakkaphong Luaengvilai on 9/20/2560 BE.
//  Copyright © 2560 Donuts. All rights reserved.
//

import Foundation

extension Array {
    
    //check array out of range
    // Safely lookup an index that might be out of bounds,
    // returning nil if it does not exist
    func get(_ index: Int) -> Element? {
        if 0 <= index && index < count {
            return self[index]
        } else {
            return nil
        }
    }
}
