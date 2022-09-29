//
//  ViewController.swift
//  Bullseye
//
//  Created by Rajeev Gulhar on 9/28/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    
    
    @IBOutlet weak var numLabel: UILabel!
    
    @IBOutlet weak var numSlider: UISlider!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var exactSwitch: UISwitch!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    @IBOutlet weak var currentLevel: UILabel!
    
    
    @IBOutlet weak var rangeLabel: UILabel!
    
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    var randomNumber = 0
    
    var range = 100
        
    var level = 1
    
    var highscore = 0
    
    override func viewDidLoad() {
            super.viewDidLoad()
            randomNumber = Int(arc4random_uniform(101))
                    numLabel.text = String(randomNumber)
        
        
        
        rangeLabel.text = String(range)
            currentLevel.text = String(level)
        currentLevel.text = String(level)
        highScoreLabel.text = String(highscore)
    }
    

    @IBAction func sliderValueChanged(_ sender: Any) {
        print(numSlider.value)
        numLabel.text  = "\(Int(numSlider.value))"
    }
    
    
    @IBAction func checkValue(_ sender: Any) {
        if exactSwitch.isOn == false {
                   if randomNumber - 3 <= Int(numSlider.value) && randomNumber + 3 >= Int(numSlider.value) {
                       resultLabel.text = "You were right on point! Bullseye!"
                       /*
                                                * We should first update the range variable in order to update rangeLabel
                                                * In this implementation I increased range by 50 but this is up to the developer!
                                                */
                                   range += 50

                                               /*
                                                * Since range is an int we would need to type cast it into a String
                                              * to be able to assign it to rangeLabel.text
                                    */
                                   rangeLabel.text = String(range)
                                               

                                               /*
                                    * To have the correct implementation we would also need to update the max
                                                * value of the slider as we are increasing range
                                                *
                                              * Since range is an int we would need to type cast it into a Float
                                              * to be able to assign it to numSlider.maximumValue
                                    */
                                   numSlider.maximumValue = Float(range)
                                       

                                           
                                               /*
                                              * When the user hits a bullseye we want to increment the level the user is currently on
                                                *
                                                * We can simply increment the level variable and assign it to currentLevel.text
                                              * like we did for range!
                                        */
                                   level += 1
                                   currentLevel.text = String(level)
                                      
                         

                                               /*
                                              * Similar to how we implemented the playAgain() function, we should reset
                                                * the slider and generate a new random number for the user.
                                                *
                                                * Unlike playAgain() however, we won't be able to use constant values and will instead
                                                * have to rely on range.
                                                *
                                                * We can use range and divide it by 2 to determine a new value for the slider to be set to
                                                * We can also use range to generate a new random number within the new range
                                                *
                                                * Note the type casting used below and how we added 1 to range when generating a new number
                                              * because arc4random_uniform() returns a random number in between 0 and the input - 1
                                        */
                                   numSlider.setValue(Float(range / 2), animated: false)
                                   randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
                                   numLabel.text = String(randomNumber)
                                               // We should hide resultLabel since it's a new round!
                                   resultLabel.isHidden = true
                   } else {
                       // Make sure to move this line of code to this else statement so we can only show "Play Again" when the user loses
                        playAgainButton.isHidden = false

                       
                       resultLabel.text = "Whoops! You missed! Try again later"
                   }
               }
        else {
            if Int(numSlider.value) == randomNumber {
                resultLabel.text = "Bullseye!"
                range += 50
                          rangeLabel.text = String(range)
                          numSlider.maximumValue = Float(range)
                              
                          level += 1
                          currentLevel.text = String(level)
                              
                          numSlider.setValue(Float(range / 2), animated: false)
                          randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
                          numLabel.text = String(randomNumber)
                          resultLabel.isHidden = true
            } else {
                playAgainButton.isHidden = false
                resultLabel.text = "You missed! Try Again."
            }
        }
        resultLabel.isHidden = false
    }
    
    
    @IBAction func playAgain(_ sender: Any) {
        numSlider.setValue(50.0, animated: false)
                randomNumber = Int(arc4random_uniform(101))
                numLabel.text = String(randomNumber)
                resultLabel.isHidden = true //must reappear next time it is checked ^
                playAgainButton.isHidden = true
        
        if level > highscore {
            if (level != 1) {
                highscore = level
                highScoreLabel.text = String(highscore)
            }
        }
           range = 100
           rangeLabel.text = String(range)
           numSlider.maximumValue = Float(range)
               
           level = 1
           currentLevel.text = String(level)
    }
    
    
}

