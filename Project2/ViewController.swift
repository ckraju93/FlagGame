//
//  ViewController.swift
//  Project2
//
//  Created by Kanchiraju on 11/26/15.
//  Copyright © 2015 Kanchy. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        //CALayer

        setImageBorder()
        
        
        
        askQuestion()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setImageBorder () {
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor

    }
    
    func askQuestion(action: UIAlertAction! = nil){
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        setImageBorder()
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        title = countries[correctAnswer].uppercaseString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
    
    @IBAction func buttonTapped(sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            ++score
        } else {
            title = "Wrong"
            --score
        }
        
        if correctAnswer == 0{
            self.button1.layer.borderWidth = 2
            self.button1.layer.borderColor = UIColor.blueColor().CGColor
        }else if correctAnswer == 1{
            self.button2.layer.borderWidth = 2
            self.button2.layer.borderColor = UIColor.blueColor().CGColor
        }else{
            self.button3.layer.borderWidth = 2
            self.button3.layer.borderColor = UIColor.blueColor().CGColor
        }
        
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion: nil)
        
        
    }

}

