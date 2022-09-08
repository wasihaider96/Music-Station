//
//  SelectMusicViewController.swift
//  Music Station
//
//  Created by Apple on 09/09/2022.
//

import UIKit
import MediaPlayer

class SelectMusicViewController: UIViewController {

    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    @IBOutlet weak var general1Btn: UIButton!
    @IBOutlet weak var general2Btn: UIButton!
    @IBOutlet weak var general3Btn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        general1Btn.layer.cornerRadius = 23.0
        general1Btn.layer.borderWidth = 2
        general1Btn.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        general2Btn.layer.cornerRadius = 23.0
        general2Btn.layer.borderWidth = 2
        general2Btn.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        general3Btn.layer.cornerRadius = 23.0
        general3Btn.layer.borderWidth = 2
        general3Btn.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        stopBtn.layer.cornerRadius = 23.0
        stopBtn.layer.borderWidth = 2
        stopBtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        nextBtn.layer.cornerRadius = 23.0
        nextBtn.layer.borderWidth = 2
        nextBtn.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func GeneralBtn(_ sender: UIButton) {
        
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playGeneral(genre: sender.currentTitle!)
            }
        }
    }
    
    @IBAction func StopBtn(_ sender: Any) {
        musicPlayer.stop()
    }
    
    @IBAction func NextBtn(_ sender: Any) {
        musicPlayer.skipToNextItem()
    }
    
    func playGeneral(genre: String) {
        
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
        
    }
}

