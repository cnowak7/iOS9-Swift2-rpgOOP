//
//  ViewController.swift
//  rpgOOP
//
//  Created by Chris Nowak on 5/25/16.
//  Copyright © 2016 Chris Nowak Tho, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // IBOutlets
    
    @IBOutlet weak var printLabel: UILabel!
    @IBOutlet weak var playerHpLabel: UILabel!
    @IBOutlet weak var enemyHpLabel: UILabel!
    @IBOutlet weak var enemyImageView: UIImageView!
    @IBOutlet weak var chestButton: UIButton!
    
    // Variables
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    // View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "CHRIS_NOWAK_THO", hp: 110, attackPower: 20)
        
        generateRandomEnemy()
        
        playerHpLabel.text = "\(player.hp) HP"
    }
    
    // Helper Methods
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPower: 12)
        } else {
            enemy = DevilWizard(startingHp: 60, attackPower: 15)
        }
        
        enemyImageView.hidden = false
        enemyHpLabel.text = "\(enemy.hp) HP"
    }
    
    // IBActions
    
    @IBAction func chestButtonPressed(sender: AnyObject) {
        chestButton.hidden = true
        printLabel.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(generateRandomEnemy), userInfo: nil, repeats: false)
    }
    
    @IBAction func attackButtonPressed(sender: AnyObject) {
        
        if enemy.isAlive {
            
            if enemy.attemptAttack(player.attackPower) {
                printLabel.text = "Attacked \(enemy.type) for \(player.attackPower) HP"
                enemyHpLabel.text = "\(enemy.hp) HP"
            } else {
                printLabel.text = "Attack was unsuccessful!"
            }
            
            if let loot = enemy.dropLoot() {
                player.addItemToInventory(loot)
                chestMessage = "\(player.name) found \(loot)"
                chestButton.hidden = false
            }
            
            if !enemy.isAlive {
                enemyHpLabel.text = ""
                printLabel.text = "Killed \(enemy.type)"
                enemyImageView.hidden = true
            }
            
        }
    }

}

