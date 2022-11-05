//
//  DetailsViewController.swift
//  hw11_api_test_project
//
//  Created by Maxim Mitin on 6.11.22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var persImage: UIImageView!
    @IBOutlet weak var persGenderLbl: UILabel!
    
    @IBOutlet weak var psipowerImg: UIImageView!
    @IBOutlet weak var psiNameLbl: UILabel!
    @IBOutlet weak var psiDescrLbl: UILabel!
    
    
    var pers: PokedexElement?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        psipowerImg.layer.cornerRadius = 40
        
    }
    
    func configView() {
        guard let person = pers else { return }
        guard let urlPers = URL(string: person.img) else {return}
        guard let urlPsi = URL(string: person.psiPowers[0].img) else {return}
        self.title = String(person.name).uppercased()
        persGenderLbl.text = "Gender: " + person.gender.rawValue
        psiNameLbl.text = person.psiPowers[0].name
        psiDescrLbl.text = person.psiPowers[0].psiPowerDescription
        
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: urlPers) else {return}
            guard let data_psi = try? Data(contentsOf: urlPsi) else {return}
            DispatchQueue.main.async {
                self.persImage.image = UIImage(data: data)
                self.psipowerImg.image = UIImage(data: data_psi)
            }
        }
    }

}
