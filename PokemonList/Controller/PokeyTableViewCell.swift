//
//  PokeyTableViewCell.swift
//  PokemonList
//
//  Created by iMac on 2022-08-21.
//

import UIKit
import SDWebImage

class PokeyTableViewCell: UITableViewCell
{
    @IBOutlet weak var pokeyImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var supertypeLabel: UILabel!
    @IBOutlet weak var evolvesFromLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    
    var buttonAction : (() -> ())?
    
    
    @IBAction func addToFavouritesTapped(_ sender: Any)
    {
        buttonAction?()
        
        //print(favouriteCards[pokey[currentRow ?? 0].id])
        //print(currentRow)
    }
     
    override func prepareForReuse()
    {
        pokeyImageView.image = nil
        nameLabel.text = ""
        supertypeLabel.text = ""
        evolvesFromLabel.text = ""
        hpLabel.text = ""
    }
    
    func setupUI(withDataFrom: Card)
    {
        nameLabel.text = "Name: " + withDataFrom.name
        hpLabel.text = "Card value: " + (withDataFrom.hp ?? "")
        evolvesFromLabel.text = "Evolves From: " + (withDataFrom.evolvesFrom ?? "")
        
        self.pokeyImageView.sd_setImage(with: URL(string: withDataFrom.imageURL), placeholderImage: UIImage(named: "pok.png"))
        
        if let supertype = withDataFrom.supertype
        {
            supertypeLabel.text = "Type: " + supertype
            
            if withDataFrom.supertype == "Trainer"
            {
                contentView.backgroundColor = .cyan
            }
            else
            {
                contentView.backgroundColor = .systemGreen
            }
        }
        
    }
    
    
}
