//
//  TodoController.swift
//  TodoAppMVC
//
//  Created by MacBook on 02/01/23.
//

import Foundation

// EL controlador es el responsable de utilizar un modelo (o varios) de manera adecuada
// es decir hace las operacoines logicas y mantiene la integridad de datos, por ejemplo,
// hace validaciones para que el modelo se utilice de forma adecuada

// Podemos pensar en el controlador como la caratula o el administrador del modelo, al cual
// lo oculata de la vista para qeu se consuma de forma responsable.
// Tambien agrega protocolos para notificarle a la vista que todo salio bien o mal, dependiendo.

// **NOTA** El controlador se dice activo por tener una instancia global y mecanismo para notificar
// hacia las vistas lo que ocurre dentro de las funciones
class TodoController {
    
    // Creamos una instancia global (Singleton)
    static let shared = TodoController()
    
    // El controlador depende de uno o de muhcos modelos, por lo que retiene una instancia
    // del modelo que sera utilizado.
    let model = TodoModel()
    
    // Operaciones de vistas
    
    // La salida de esta funcoin no es un valor devulto, sino que atraves de un protocolo
    // arrojamos la salida
    // Carga y devuelve los "Todos" del modelo
    func getTodos(onTodos getable: TodoGetable?) {
        model.loadTodos()
        getable?.onTodos(todos: model.todos)
    }
    
    func addTodos(title: String, onTodoCreated creatable: TodoCreatable?) {
        
        if let todo = model.addTodo(title: title) {
            creatable?.onTodoCreated(newTodo: todo, allTodos: model.todos)
        }
        
    }
    
    func updateTodoTitle(index: Int, title: String, onTodoUpdated updatable: TodoUpdatetable?) {
        
        if let todo = model.updateTodoTItle(index: index, title: title) {
            updatable?.onTodoUpdated(todo: todo, todos: model.todos)
        }
    }
    
    func updateTodoCheck(index: Int, checked: Bool, onTodoUpdated updatable: TodoUpdatetable?) {
        
        if let todo = model.updateTodoCheck(index: index, checked: checked) {
            updatable?.onTodoUpdated(todo: todo, todos: model.todos)
        }
    }
    
    func deleteTodo(index: Int, onTodoDeleted deletable: TodoDeletable?) {
        
        if let todo = model.deleteTodo(index: index) {
            deletable?.onTodoDeleted(todo: todo, todos: model.todos)
        }
    }
}

// MARK: PROTOCOLOS

// Establece el protocolo para que alguien capaz de recibir una lista de "TodoEntity"
// Delegate
protocol TodoGetable {
    
    // ([TodoEntity]) -> Void
    func onTodos(todos: [TodoEntity])
}

protocol TodoCreatable {
    
    // (TodoEntity, [TodoEntity]) -> Void
    func onTodoCreated(newTodo: TodoEntity, allTodos: [TodoEntity])
}

protocol TodoUpdatetable {
    
    // (TodoEntity, [TodoEntity]) -> Void
    func onTodoUpdated(todo: TodoEntity, todos: [TodoEntity])
}

protocol TodoDeletable {
    
    // (TodoEntity, [TodoEntity]) -> Void
    func onTodoDeleted(todo: TodoEntity, todos: [TodoEntity])
}
