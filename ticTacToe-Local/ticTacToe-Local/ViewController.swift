//
//  ViewController.swift
//  ticTacToe-Local
//
//  Created by Ali Alshahrani on 12/16/18.
//  Copyright © 2018 Ali Alshahrani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var bu1: UIButton!
    @IBOutlet weak var bu2: UIButton!
    @IBOutlet weak var bu3: UIButton!
    @IBOutlet weak var bu4: UIButton!
    @IBOutlet weak var bu5: UIButton!
    @IBOutlet weak var bu6: UIButton!
    @IBOutlet weak var bu7: UIButton!
    @IBOutlet weak var bu8: UIButton!
    @IBOutlet weak var bu9: UIButton!
    
    
    // NOT used and auto created by Xcode
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    

    @IBAction func buttonSelectEvent(_ sender: Any) {
        
        let buttonSelected = sender as! UIButton
        gamePlaying(buttonSelect: buttonSelected)
    }
    
    
    var activePlayer = 1 // This var to switch between users to player
    var player1:Array = [Int]() // This Array to gather the tag buttons of player one
    var player2:Array = [Int]() // This Array to gather the tag buttons of player two
    
    func gamePlaying (buttonSelect: UIButton) {
        
        if activePlayer == 1 {
            
            buttonSelect.setTitle("X", for: UIControl.State.normal)
            buttonSelect.backgroundColor = UIColor(red: 102/255, green: 250/255, blue: 51/255, alpha: 0.5)
            player1.append(buttonSelect.tag)
            activePlayer = 2
            autoPlayer()
            
        } else {
            
            buttonSelect.setTitle("O", for: UIControl.State.normal)
            buttonSelect.backgroundColor = UIColor(red: 88/255, green: 231/255, blue: 147/255, alpha: 0.5)
            player2.append(buttonSelect.tag)
            activePlayer = 1
        }
        buttonSelect.isEnabled = false
        findWinner()
        
    }
    
    func findWinner () {
        
        var winner = -1
        
        // row1 - player 1
        if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
            
            winner = 1
        }
        
        // row1 - player 2
        if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
            
            winner = 2
        }
        
        // row2 - player 1
        if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
            
            winner = 1
        }
        
        // row2 - player 2
        if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
            
            winner = 2
        }
        
        // row3 - player 1
        if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
            
            winner = 1
        }
        
        // row3 - player 2
        if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
            
            winner = 2
        }
        
        
        
        // col1 - player 1
        if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
            
            winner = 1
        }
        
        // col1 - player 2
        if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
            
            winner = 2
        }
        
        // col2 - player 1
        if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
            
            winner = 1
        }
        
        // col2 - player 2
        if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
            
            winner = 2
        }
        
        // col3 - player 1
        if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
            
            winner = 1
        }
        
        // col3 - player 2
        if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
            
            winner = 2
        }
        
        // X1 - player 1
        if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
            
            winner = 1
        }
        
        // X1 - player 2
        if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
            
            winner = 2
        }
        
        // X2 - player 1
        if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
            
            winner = 1
        }
        
        // X2 - player 2
        if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
            
            winner = 2
        }
        
        
        if winner != -1 {
            
            var msg = ""
            
            if winner == 1 {
                msg = "Player 1 is winner"
            } else {
                msg = "Player 2 is winner"
            }
            
            // show Alert msg
            
            let alert = UIAlertController (title: "Oh!! we have Winner", message: msg, preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    
    func autoPlayer () {
        
        // scan the empty cells
        var emptyCells:Array = [Int]()
        
        for index in 1...9 {
            
            if !(player1.contains(index) || player2.contains(index)) {
                
            emptyCells.append(index)
            
            }
        }
        
   
    
    
        let randomIndex = arc4random_uniform(UInt32(emptyCells.count))
        let cell_ID = emptyCells[Int(randomIndex)]
        
        var buSelect:UIButton?
        
        switch cell_ID {
        case 1:
            buSelect = bu1
        case 2:
            buSelect = bu2
        case 3:
            buSelect = bu3
        case 4:
            buSelect = bu4
        case 5:
            buSelect = bu5
        case 6:
            buSelect = bu6
        case 7:
            buSelect = bu7
        case 8:
            buSelect = bu8
        case 9:
            buSelect = bu9
        default:
            buSelect = bu1
        }
        
        gamePlaying(buttonSelect: buSelect!)
        
    }
}

