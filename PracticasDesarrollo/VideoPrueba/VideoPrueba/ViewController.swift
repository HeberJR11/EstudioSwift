//
//  ViewController.swift
//  VideoPrueba
//
//  Created by MacBook on 28/12/22.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playVideo(_ sender: Any) {
        guard let url = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4") else { return }
        
        // Cree un AVPlayer, pasándole la URL HTTP Live Streaming.
        let player = AVPlayer(url: url)
        
        // Crear un nuevo AVPlayerViewController y pasarle una referencia al jugador.
        let controller = AVPlayerViewController()
        controller.player = player
        
        // Presentar modalmente al jugador y llamar al método play() del jugador cuando se complete.
        present(controller, animated: true) {
            player.play()
        }
    }
}

