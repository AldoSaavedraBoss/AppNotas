//
//  ViewController.swift
//  AppNotas
//
//  Created by Mac10 on 03/10/21.
//

import UIKit

class ViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    var notas = ["Hacer ejercicio", "Desayunar"]
    var horas = ["6:00am", "7:00am"]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = TablaNotas.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = notas[indexPath.row]
        celda.detailTextLabel?.text = horas[indexPath.row]
        return celda
    }
    
    @IBAction func AddNota(_ sender: UIBarButtonItem) {
        let alerta = UIAlertController(title: "Nueva nota", message: "Agregar", preferredStyle: .alert)
        
        alerta.addTextField{(nombreAlerta) in
            nombreAlerta.placeholder = "Agregar Descripcion"
        }
        
        alerta.addTextField { (horaAlerta) in
            horaAlerta.placeholder = "Agregar hora"
        }
        
        let accionAceptar = UIAlertAction(title: "OK", style: .default) { _ in
            guard let nota = alerta.textFields?.first?.text else {return}
            guard let hora = alerta.textFields?.last?.text else {return}
            self.notas.append(nota)
            self.horas.append(hora)
            self.TablaNotas.reloadData()
        }
        
        let accionCancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        
        alerta.addAction(accionAceptar)
        alerta.addAction(accionCancelar)
        
        present(alerta, animated: true)
    }
    
    @IBOutlet weak var TablaNotas: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

