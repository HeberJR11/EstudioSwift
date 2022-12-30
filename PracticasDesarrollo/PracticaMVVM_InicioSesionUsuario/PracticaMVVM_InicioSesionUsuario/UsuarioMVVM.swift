/*
 Heber Eduardo Jimenez Rodriguez
 
 Creado el 23-12-22
 
 Práctica - Uso de MVVM
 */

import Foundation
import Combine

// MARK: Models
// Estructura que retendra los datos del usuario desde la API o autogenerado
struct UsuarioData: Decodable {
    
    let id: Int
    let correo: String
    let contraseña: String
}

/*
// Estructura para el loginResponse
struct LoginResponse: Decodable {
    
    let error: Bool
    let mensaje: String
    let usuario: UsuarioData
    
}
 */

// MARK: ViewModels

// Clase que guarda sujetos
class LoginViewModel {
    
    // Singleton
    static var shared = LoginViewModel()
    
    // Sujeto que inicia sesion, apartir de la tupla(correo, contraseña) que reciba
    let iniciaSesionSubject = PassthroughSubject<(correo: String, contraseña: String), Never>()
    
    // Sujeto que escucha si un usuario ha iniciado sesion
    let usuarioAutenticadoSubject = PassthroughSubject<UsuarioData, Never>()
    
    var iniciaSesionSubscriber: AnyCancellable?
    
    init() {
        iniciaSesionSubscriber = self.iniciaSesionSubject.sink(receiveValue: { (correo: String, contraseña: String) in
            print("Recibiendo correo: \(correo), contraseña: \(contraseña)")
            LoginModel.shared.iniciarSesion(correo: correo, contraseña: contraseña)
        })
    }
}

// Clase LoginModel donde se inicia sesion
class LoginModel {
    
    // Singleton
    static let shared = LoginModel()
    
    // Variable para retener el usuario logueado
    var usuario: UsuarioData? = nil
    
    /*
    // Suscribimos para inicar sesion
    let iniciaSesionSubscriber = LoginViewModel.shared.iniciaSesionSubject.sink { (correo: String, contraseña: String) in
        
        // Print de pueba
        print("Recibiendo correo y contraseña")
        
        // Le pasamos el correo y contraseña por medio del singleton
        LoginModel.shared.iniciarSesion(correo: correo, contraseña: contraseña)
    }*/
    
    func iniciarSesion(correo: String, contraseña: String) {
        
        // Print de pueba
        print("Iniciando sesion \(correo) \(contraseña)")
        
        if correo == "batman@gmail.com" && contraseña == "1234" {
            let usuario = UsuarioData(id: 1, correo: correo, contraseña: contraseña)
            // Aqui le pasamos el usuario
            self.usuario = usuario
            // Notificamos al usuario autenticado que ya hay un usuario logueado
            LoginViewModel.shared.usuarioAutenticadoSubject.send(usuario)
            
        }
    }
}


