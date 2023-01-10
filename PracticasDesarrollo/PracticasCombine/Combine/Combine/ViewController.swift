//
//  ViewController.swift
//  Combine
//
//  Created by MacBook on 22/12/22.
//

import UIKit
/// **Paso 1** Importar Combine
import Combine
/// Este framework nos permite controlar objetos de forma reactiva
/// a traves de Publicadores(publisher), sujetos(subject) y suscriptores(subscriptor)
///
/// Estos tienen el objetivo de generar una instancia capaz de reportar valores que esten
/// siendo enviados( atraves de publicador) y recibidos (a traves del suscriptor).
///
/// De todo el framehork lo mas util sera entender la parte del sujeto y la suscripcion.
///
/// Existe un sujeto llamado PassthroughSubject el cual retiene un ultimo valor pasado
/// y permite suscribirse a dichos valores, para poder observar cual es el objeto enviado o pasado.
///
/// Cada que el sujeto envia un valor nuevo, los suscriptores pueden recibirlo y procesarlo,
/// incluso aplicarles en mapeo previo o alguna logica.


class ViewController: UIViewController {
    
    @IBOutlet weak var frutaLabel: UILabel!
    
    @IBOutlet weak var frutaTextField: UITextField!
    
    /// **Paso 2** Diseñar un sujeto de tipo PassthroughtSubject
    var subjectFrutas = PassthroughSubject<String, Never>()
    
    /// **Paso 2.5** Diseñar un suscriptor de tipo AnyCancellable?
    var suscriptorFrutas: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// **Paso 3** Para consumir el sujeto, creamos una suscripcion del tipo sink la cual asociara
        /// una clausura del tipo (String) -> Void que nos permite establecer que hacer con String pasado
        /// sobre el sujeto.
        /// Cada que el sujeto recibe un valor, el suscriptor ejecuta la clausura y determina que hacer.
        /// El resultado sera un AnyCancellable capaz de inhibir al suscriptor para dejar de procesar los
        /// objetos (de tipo String) que estan siendo recibidos
        /// **Nota** El suscriptorFrutas sera retenido durante el ciclo de vida qeu tenga
        suscriptorFrutas = subjectFrutas.sink {
            fruta in
            print("Se ha recibido una fruta \(fruta)")
            self.frutaLabel.text = fruta
        }
    }
    
    
    @IBAction func enviarFutaAction(_ sender: Any) {
        
        if let frutaText = frutaTextField.text {
            print("Se desea enviar la fruta \(frutaText) al sujeto")
            /// **Paso 3** Podemos enviarle objetso de tipo string a nuestro sujeto para que todos los sucriptores
            /// los reciban y procesen como mas les convenga
            subjectFrutas.send(frutaText)
        }
    }
}


///**Nota**
/// sink = crear un suscriptor(recibe el objeto en una clausura)
/// send = Enviar un objeto

