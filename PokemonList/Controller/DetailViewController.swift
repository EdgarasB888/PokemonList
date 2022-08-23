//
//  DetailViewController.swift
//  PokemonList
//
//  Created by iMac on 2022-08-21.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var rarityLabel: UILabel!
    @IBOutlet weak var subtypeLabel: UILabel!
    @IBOutlet weak var cardSetLabel: UILabel!
    @IBOutlet weak var setCodeLabel: UILabel!
    @IBOutlet weak var highResCardView: UIImageView!
    
    var pokemon: Card?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupDetailedView()
    }
    
    func setupDetailedView()
    {
        title = pokemon?.name
        
        self.highResCardView.sd_setImage(with: URL(string: pokemon?.imageURLHiRes ?? "pok.png")/*, placeholderImage: UIImage(named: "pok.png")*/)
        
        rarityLabel.text = "Rarity: " + (pokemon?.rarity ?? "")
        subtypeLabel.text = "Subtype: " + (pokemon?.subtype ?? "")
        cardSetLabel.text = "Card set: " + (pokemon?.cardSet ?? "")
        setCodeLabel.text = "Set code: " + (pokemon?.setCode ?? "")
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "learnMoreID"
        {
            guard let learnMoreVC = segue.destination as? LearnMoreViewController else {return}
            learnMoreVC.titleLabelText = pokemon?.name ?? ""
            
            var description: String? = ""
            for value in pokemon?.text ?? []
            {
                description = description?.appendingFormat("\(value), ")
            }
            learnMoreVC.descriptionLabelText = description ?? "No info to display!"
        }
    }
    

}
