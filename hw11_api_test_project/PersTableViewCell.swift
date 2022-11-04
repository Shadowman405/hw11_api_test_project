//
//  PersTableViewCell.swift
//  hw11_api_test_project
//
//  Created by Maxim Mitin on 4.11.22.
//

import UIKit

class PersTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var persImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    
    
    func configCell(with pers: PokedexElement) {
        nameLbl.text = pers.name ?? "1"
        genderLbl.text = pers.gender.rawValue ?? "1"
        
        guard let url = URL(string: pers.img ) else {return}

        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.persImage.image = UIImage(data: imageData)
            }
        }
    }

}
