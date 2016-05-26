//
//  Enemy.swift
//  rpgOOP
//
//  Created by Chris Nowak on 5/26/16.
//  Copyright © 2016 Chris Nowak Tho, LLC. All rights reserved.
//

import Foundation

class Enemy : Character {
    var loot: [String] {
        return ["Rusty Dagger", "Cracked Buckler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        return nil
    }
}