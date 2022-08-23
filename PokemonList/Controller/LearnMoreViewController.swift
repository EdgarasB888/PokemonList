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
    var descriptionLabelText = "No info to display!"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        titleLabel.text = titleLabelText
        descriptionLabel.text = descriptionLabelText

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
