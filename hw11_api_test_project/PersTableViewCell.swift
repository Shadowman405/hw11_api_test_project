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
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        func configCell(with pers: PokedexElement) {
            nameLbl.text = pers.name
            genderLbl.text = pers.gender.rawValue
            
            guard let url = URL(string: pers.img ) else {return}

            DispatchQueue.global().async {
                guard let imageData = try? Data(contentsOf: url) else { return }
                DispatchQueue.main.async {
                    self.persImage.image = UIImage(data: imageData)
                }
            }
        }
    }

}
