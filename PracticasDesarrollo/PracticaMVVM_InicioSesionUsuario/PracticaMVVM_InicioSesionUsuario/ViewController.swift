/*
 Heber Eduardo Jimenez Rodriguez
 
 Creado el 23-12-22
 
 Práctica - Uso de MVVM
 */

// curl 'http://34.125.242.89:80/login?email=batman@ligajusticia.com&password=robin123'
// segue = welcomeSegue

import UIKit
import Combine

// MARK: Vistas
class ViewController: UIViewController {
    
    @IBOutlet weak var nombreTextField: UITextField!
    
    @IBOutlet weak var contraseñaTextField: UITextField!
    
    var usuarioAutenticadoSubscriber: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usuarioAutenticadoSubscriber = LoginViewModel.shared.usuarioAutenticadoSubject.sink {
            usuario in
            self.performSegue(withIdentifier: "welcomeSegue", sender: usuario)
        }
    }
    
    @IBAction func iniciarSesionButton(_ sender: Any) {
        print("Entrando")
        if let correo = nombreTextField.text, let contraseña = contraseñaTextField.text {
            print("Enviando correo: \(correo) y contraseña: \(contraseña)")
            LoginViewModel.shared.iniciaSesionSubject.send((correo: correo, contraseña:contraseña))
        }
    }
}
