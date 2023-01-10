//
//  SceneDelegate.swift
//  RepasoCoreData
//
//  Created by MacBook on 29/12/22.
//

import UIKit
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    /// **PASO 1** - Creacion del contenedor
    /// Clousure auto-invocable () -> NSPersistentContainer
    let appPersistectContainer: NSPersistentContainer = {
        
        // Creamos una instancia de la entidad "AppModel"
        let container = NSPersistentContainer(name: "AppModel")
        
        // Pedimos que nos traiga todo lo que contiene el contenedor "container" (Entidades y contextos)
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("No se pudo recuperar el contenedor. Error: \(error)")
                // TODO: Muestrale una alerta al usuario
            }
        }
        // Si logor obtener los datos ocn exito, nos los regresa
        return container
    }()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
    /// **PASO 3** - Enlaza(envia) la instancia del appPersistentContainer
    /// hacia la vista (ViewController)
        
    /// *NOTA* Hay que hacer las conversiones(reconversiones) necesarias paar poder
    /// utilizar nuestra vista correctamente
        
        // Pedimos a la ventana que nos recupere nuestra vista(ViewController)
        if let viewController = window?.rootViewController as? ViewController {
            
            // Le explicamos a la vista que su contenedor es nuestro contenedor
            viewController.appPersistentContainer = self.appPersistectContainer
        }
        
    /// *NOTA2* Si la vista principal(rootViewController) es un NavigationViewController
    /// tendremos que recuperar el ViewController desde el navigationController
    /// lo cual aumentara la complejidad
        
        if let navigationController = window?.rootViewController as? UINavigationController {
            if let viewController = navigationController.viewControllers.first as? ViewController {
                viewController.appPersistentContainer = self.appPersistectContainer
            }
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

