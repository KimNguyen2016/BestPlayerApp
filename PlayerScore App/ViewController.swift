//
//  ViewController.swift
//  PlayerScore App
//
//  Created by Kim Nguyen on 2016-09-11.
//  Copyright © 2016 Kim Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var player: UILabel!
    @IBOutlet var score: UILabel!
    @IBOutlet var highScore: UILabel!
    @IBOutlet var leader: UILabel!
    @IBOutlet var textField: UITextField!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    var users = [String]()
    
    var currentPlayer = ""
    
    var scoreTotal = 0
    
    var highScoreTotal = 0
    
    var leaderName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set cursor
        
        let newCursor = textField.beginningOfDocument
        textField.selectedTextRange = textField.textRangeFromPosition(newCursor, toPosition: newCursor)
        
        if userDefaults.valueForKey("highScore") != nil && userDefaults.valueForKey("leader") != nil && userDefaults.valueForKey("usernames") != nil {
            highScoreTotal = userDefaults.valueForKey("highScore") as! Int
        
            leaderName = userDefaults.valueForKey("leader") as! String
            
            users = userDefaults.valueForKey("usernames") as! Array
            
        
            highScore.text = "\(highScoreTotal)"
            
            leader.text = leaderName
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func addPlayer(sender: AnyObject) {
        
        currentPlayer = textField.text!
        
        textField.text = ""
        
        player.text = currentPlayer
        
        users.append(currentPlayer)
        
        userDefaults.setObject(users, forKey: "usernames")
    }
    
    
    @IBAction func addToScore(sender: UIButton) {
        
        scoreTotal += 10
        score.text = "\(scoreTotal)"
        
        if scoreTotal > highScoreTotal {
            
            highScoreTotal = scoreTotal
            highScore.text = "\(highScoreTotal)"
            leader.text = currentPlayer
            leaderName = currentPlayer
            
            userDefaults.setValue(highScoreTotal, forKey: "highScore")
            
            userDefaults.setValue(leaderName, forKey: "leader")
            
            
            
        }
    }
    
    
    @IBAction func reset(sender: AnyObject) {
        
        scoreTotal = 0
        score.text = "0"
        
        player.text = ""
        textField.text = ""
        
    }
    
}

