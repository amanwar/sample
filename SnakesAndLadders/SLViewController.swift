//
//  MasterViewController.swift
//  SnakesAndLadders
//
//  Created by atul on 10/09/14.
//  Copyright (c) 2014 LM. All rights reserved.
//

import UIKit

class SLViewController: UIViewController, DiceGameDelegate {
    let game = SnakesAndLadders()
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!

//    var detailItem: AnyObject? {
//        didSet {
//            // Update the view.
//            self.configureView()
//        }
//    }
//    
//    func configureView() {
//        // Update the user interface for the detail item.
//        if let detail: AnyObject = self.detailItem {
//            if let label = self.detailDescriptionLabel {
//                label.text = detail.description
//            }
//        }
//    }
    
    @IBAction func playGame(AnyObject) {
        playButton.userInteractionEnabled = false
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
            {self.game.play()})
    }
    
    func updateGame(newPosition: Int) {
        dispatch_async(dispatch_get_main_queue(), {
            if let label = self.detailDescriptionLabel {
                if newPosition == 25 {
                    label.text = "Game ended!!!"
                    let alertView = UIAlertView(title: "Awesome!", message: "You completed the game. Click play to start over again.", delegate: self, cancelButtonTitle: "OK")
                    alertView.show()
                    self.playButton.userInteractionEnabled = true
                } else {
                    label.text = "New position is \(newPosition)"
                }
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        game.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}