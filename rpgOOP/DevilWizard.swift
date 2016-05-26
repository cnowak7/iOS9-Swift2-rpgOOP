//
//  DevilWizard.swift
//  rpgOOP
//
//  Created by Chris Nowak on 5/26/16.
//  Copyright © 2016 Chris Nowak Tho, LLC. All rights reserved.
//

import Foundation

class DevilWizard : Enemy {
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}