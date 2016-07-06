//
//  ViewController.swift
//  Tapper
//
//  Created by Minh Le on 7/6/16.
//  Copyright © 2016 MinhLe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    //Properties:
    var maxTap: Int = 0
    var currentTap: Int = 0
    
    //Outlets:
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTaps: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    @IBAction func onCoinTapped(sender: UIButton!){
        
        currentTap += 1
        updateTapLabel()
        
        if isGameOver(){
            
            restartGame()
            
        }
    }
    
    @IBAction func onPlayBtnPressed(sender: UIButton!){
        

        
        
        if howManyTaps.text != nil && howManyTaps.text != ""{
            logoImg.hidden = true
            playBtn.hidden = true
            howManyTaps.hidden = true
            
            tapBtn.hidden = false
            tapsLabel.hidden = false
            
            
            maxTap = Int(howManyTaps.text!)!
            currentTap = 0
            updateTapLabel()
        }
        
        
        
    }
    
    func restartGame(){
        maxTap = 0
        howManyTaps.text = ""
        logoImg.hidden = false
        playBtn.hidden = false
        howManyTaps.hidden = false
        
        tapBtn.hidden = true
        tapsLabel.hidden = true

    }
    
    
    func isGameOver() -> Bool{
        if currentTap >= maxTap{
            return true
        }
        return false
    }
    
    
    func updateTapLabel(){
        tapsLabel.text = "\(currentTap) Taps"

        
    }
    
    // Controlling the keyboard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.howManyTaps.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textfieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder()
        return true
    }

}

