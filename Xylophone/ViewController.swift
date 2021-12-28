//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha /= 2
        
        playSound(withFileName: sender.currentTitle!)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha *= 2
        }
    }
    
    var player: AVAudioPlayer?

    func playSound(withFileName fileName: String) {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "wav") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

