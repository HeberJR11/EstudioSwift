//
//  seleccionarFrutaViewController.swift
//  CombineProject2MultiPantalla
//
//  Created by MacBook on 22/12/22.
//

import UIKit
import Combine

class seleccionarFrutaViewController: UIViewController {
    
    // Paso 1 del picker asociar el picker a nuestro codigo
    @IBOutlet weak var frutasPickerView: UIPickerView!
    
    // Paso 2 del picker Variable que retenga la sfrutas
    var frutas = ["Manzana", "Mango", "Kiwi", "Platano", "Pera", "Papaya", "Melon"]
    
    // weak porque no pertenece a esta vista
    weak var frutasSubject: PassthroughSubject<String, Never>?
    
    var frutaSeleccionada: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        frutasPickerView.dataSource = self
        frutasPickerView.delegate = self
        frutaSeleccionada = frutas[0]
    }
    
    @IBAction func cancelarAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func aceptarAction(_ sender: Any) {
        
        // Le pasamos la fruta si es que existe
        if let frutasSubject = frutasSubject, let frutaSeleccionada = frutaSeleccionada {
            frutasSubject.send(frutaSeleccionada)
            self.dismiss(animated: true)
        }
    }
}

extension seleccionarFrutaViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Numero de secciones(rodillos)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Numero de componentes(elementos en el pickerView)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return frutas.count
    }
    
    // Titulo o lo que se mostrara en los rodillos
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return frutas[row]
    }
    
    // Funcion para saber que fruta seleccionamos
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        frutaSeleccionada = frutas[row]
    }
}
