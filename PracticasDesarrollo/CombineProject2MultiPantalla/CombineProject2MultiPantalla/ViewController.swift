//
//  ViewController.swift
//  CombineProject2MultiPantalla
//
//  Created by MacBook on 22/12/22.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var frutaLabel: UILabel!
    
    //[1] Retiene un sujeto capaz de pasar objetos tipo String
                              // que vamos enviar, tipo de error
    var frutasSubject = PassthroughSubject<String, Never>()
    
    //[2] Variable para retener un suscriptor capaz de hacer algo con los objetos de tipo String
    var frutasSubscribe: AnyCancellable?
    
    // Funcion que envia los datos a la otra pantalla a traves del segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goPantalla2" {
            if let seleccionarFrutasViewController = segue.destination as? seleccionarFrutaViewController {
                seleccionarFrutasViewController.frutasSubject = self.frutasSubject
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //[3]
        frutasSubscribe = frutasSubject.sink {
            fruta in
            self.frutaLabel.text = fruta
        }
    }
}

