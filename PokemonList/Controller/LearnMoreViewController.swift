//
//  LearnMoreViewController.swift
//  PokemonList
//
//  Created by iMac on 2022-08-22.
//

import UIKit

class LearnMoreViewController: UIViewController
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var titleLabelText = ""
    var descriptionLabelText = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        titleLabel.text = titleLabelText
                
        if(descriptionLabelText == "")
        {
            descriptionLabel.textAlignment = .center
            descriptionLabelText = "No info to display!"
        }
        else
        {
            descriptionLabel.text = descriptionLabelText
        }
        
    }
}
