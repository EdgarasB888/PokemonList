//
//  FavouritesTableViewCell.swift
//  PokemonList
//
//  Created by iMac on 2022-08-24.
//

import UIKit

class FavouritesTableViewCell: UITableViewCell
{
    @IBOutlet weak var favouriteImageView: UIImageView!
    @IBOutlet weak var favouriteNameLabel: UILabel!
    @IBOutlet weak var favouriteTypeLabel: UILabel!
    @IBOutlet weak var favouriteEvolvesFromLabel: UILabel!
    @IBOutlet weak var favouriteCardValue: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse()
    {
        favouriteImageView.image = nil
        favouriteNameLabel.text = ""
        favouriteTypeLabel.text = ""
        favouriteEvolvesFromLabel.text = ""
        favouriteCardValue.text = ""
    }

    func setupUI(withDataFrom: Card)
    {
        favouriteNameLabel.text = "Name: " + withDataFrom.name
        favouriteCardValue.text = "Card value: " + (withDataFrom.hp ?? "")
        favouriteEvolvesFromLabel.text = "Evolves From: " + (withDataFrom.evolvesFrom ?? "")
        
        self.favouriteImageView.sd_setImage(with: URL(string: withDataFrom.imageURL), placeholderImage: UIImage(named: "pok.png"))
        
        if let supertype = withDataFrom.supertype
        {
            favouriteTypeLabel.text = "Type: " + supertype
            
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
