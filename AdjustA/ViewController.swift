//
//  ViewController.swift
//  AdjustA
//
//  Created by sakura0221 on 2019/12/26.
//  Copyright © 2019 sakura0221. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    @IBOutlet var ButtonImage: UIButton!
    @IBOutlet weak var sliderText: UILabel!
    let stopImage = UIImage(named: "stop")
    let playImage = UIImage(named: "play")
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(self.playingCheck), userInfo: nil, repeats: true)
        setAudioPlayer(soundName: "oboe", type: "mp3")

    }
    
    @IBAction func oboePlay(){
        audioPlayer.play()
    }
    
    @IBAction func oboeStop(){
        audioPlayer.stop()
    }
    
    func setAudioPlayer(soundName: String, type: String) {
        
        let soundFilePath = Bundle.main.path(forResource: soundName, ofType: type)!
        let fileURL = URL(fileURLWithPath: soundFilePath)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
        } catch {
            print("音楽ファイルが読み込めませんでした")
        }
    }
    
    @IBAction func sliderValue(_ sender: UISlider) {
//        sliderText.text = String(sender.value)
        audioPlayer.volume = sender.value
    }
    
    @objc func playingCheck () {
        if !(audioPlayer.isPlaying) {
            ButtonImage.setImage(playImage, for: .normal)
            ButtonImage.addTarget(self, action: #selector(self.oboePlay), for: .touchUpInside)
        }
        if (audioPlayer.isPlaying) {
            ButtonImage.setImage(stopImage, for: .normal)
            ButtonImage.addTarget(self, action: #selector(self.oboeStop), for: .touchUpInside)
        }
    }
}

