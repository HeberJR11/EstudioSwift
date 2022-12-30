import UIKit

/*
 Manejo de Errores
 
 Diseñar una funcion capaz de arrojar errrores que reciba
 una lista de productos de la estructura Producto y
 devuelva el precio total de todos de todos los productos.
 */

struct Producto {
    let id: Int
    let nombre: String
    let precio: Double
    let existencias: Int
}

// Crear la enumeración de errores
enum CrearProductoError: Error {
    
    case productoIdMayor100
    case productoSinExistencias
    case precioMayor1000
}

func crearProducto(precio: Double, existencias: Int, id: Int) throws -> Producto {
    
    if precio > 1000 {
        
        throw CrearProductoError.precioMayor1000
    }
    
    if existencias <= 0 {
        
        throw CrearProductoError.productoSinExistencias
    }
    
    if id > 100 {
        throw CrearProductoError.productoIdMayor100
    }
    
    let id = Int.random(in: 1...150)
    return Producto(id: id, nombre: "Producto \(id)", precio: precio, existencias: existencias)
}

var total = 0.0
for _ in 1...5 {
    do {
        
        let producto = try crearProducto(precio: Double.random(in: 1...1500), existencias: Int.random(in: -5...15), id: Int.random(in: 1...150))
        
        //var total = 0.0
        total += producto.precio
        print(producto)
        print("---------------------------")
    } catch CrearProductoError.productoIdMayor100 {
        print("ERROR: El producto tiene id mayor a 100")
        print("---------------------------")
    } catch CrearProductoError.precioMayor1000 {
        print("ERROR: El precio es mayor a 1000, es muy caro")
        print("---------------------------")
    } catch CrearProductoError.productoSinExistencias {
        print("ERROR: No hay existenicas del producto")
        print("---------------------------")
    }catch {
        print("ERROR: Error desconocido, no puedo crear el producto")
        print("---------------------------")
    }
}
print(total)







