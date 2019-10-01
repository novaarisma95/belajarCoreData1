//
//  ViewController.swift
//  belajarCoreDataSeptember
//
//  Created by Nova Arisma on 9/30/19.
//  Copyright © 2019 Nova Arisma. All rights reserved.
//

import UIKit //framework
import CoreData  //import dulu

class ViewController: UIViewController {
    //konekin dulu
    @IBOutlet weak var barangPertama: UITextField!
    @IBOutlet weak var barangKedua: UITextField!
    @IBOutlet weak var hargaBarangPertama: UITextField!
    @IBOutlet weak var hargaBarangKedua: UITextField!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var save: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()  //akan mengambil parameter dalam superclassnya
       
    }
    func saveAll(){
        let saveBarangPertama = barangPertama.text
        let saveBarangKedua = barangKedua.text
        let saveHargaBarangPertama = Int(hargaBarangPertama.text!)
        let saveHargaBarangKedua = Int(hargaBarangKedua.text!)
        
        //guard bisa kondisinya lebih dari 1
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
            return
        }
        //persiapan data model
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Barang", in: managedContext)!
        let barangKeCoreData = NSManagedObject(entity: entity, insertInto: managedContext)
        //set dulu valuenya
        barangKeCoreData.setValue(saveBarangPertama, forKey: "barangPertama")
        barangKeCoreData.setValue(saveBarangKedua, forKey: "barangKedua")
        barangKeCoreData.setValue(saveHargaBarangPertama, forKey: "hargaBarangPertama")
        barangKeCoreData.setValue(saveHargaBarangKedua, forKey: "hargaBarangKedua")
        
        do {
            try managedContext.save()
            print("Core Data Masuk")
            label.text = "Core Data Masuk"
        } catch let error as NSError {
            print("Could not save.\(error), \(error.userInfo)")
        }

    }

    @IBAction func button(_ sender: UIButton) {
        saveAll()
    }
    
}

