//
//  Pantalla2ViewController.swift
//  UsoSegues
//
//  Created by MacBook on 20/12/22.
//

import UIKit

class Pantalla2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        print("Esto se ejecuta al hacer unwind segue")
        // Elimina la vista actual.
        self.dismiss(animated: true)
    }

}
