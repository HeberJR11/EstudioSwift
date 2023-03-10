//
//  SceneDelegate.swift
//  3302_CoreData
//
//  Created by MacBook on 21/12/22.
//

import UIKit
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    /// **PASO 1** - Definir un persistentConytainer a nivel appdelegate
    private lazy var persistentContainer: NSPersistentContainer = {
        ///1. Creamos un contenedor persistente
        let container = NSPersistentContainer(name: "ProductoModel")
        
        ///2. Configuramos el contenedor persistente
        container.loadPersistentStores {
            (storeDescription, error) in
            if let error = error {
                fatalError("No se pudo configurar el contenedor persistente \(error)")
            }
        }
        /// 3. Devolvemos el contenedor persistente
        return container
    }() /// **Nota:** Esta clausura debe auto-ejecutarse
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        /// **PASO 2** - Recuperar el RootViewController (elcontrolador princial) para sociar al persistentContainer y tenga acceso a el.
        /// Recuperamos el viewController de la clase ViewController
        if let viewController = window?.rootViewController as? ViewController {
            /// Asociar el persistantContainer al rootViewController
            viewController.persistentContainer = persistentContainer
            
            /// Como paso 3 debemos ir al ViewController y crear la variable persistentContainer: NSPersistentContainer?
            
            /// **ADVERTENCIA** Si el rootViewController es un NavigationViewController, debemos recuperar el ViewController principal
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
}
