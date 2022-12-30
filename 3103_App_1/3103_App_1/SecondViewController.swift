//
//  SecondViewController.swift
//  3103_App_1
//
//  Created by MacBook on 19/12/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var label: UILabel?
    
    @IBAction func pulsarBoton() {
        print("El boton fue pulsado")
        label?.text = "Hola mundo"
    }
}
