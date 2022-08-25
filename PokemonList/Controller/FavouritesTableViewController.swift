//
//  FavouritesTableViewController.swift
//  PokemonList
//
//  Created by iMac on 2022-08-21.
//

import UIKit

class FavouritesTableViewController: UITableViewController
{
    var userDefaults = UserDefaults.standard
    var favouriteCards: [String: Bool] = [:]
    var pokey: [Card] = []
    var favouritesToDisplay: [Card] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadUserDefaults()
        retrieveFavourites()
        
        title = "Favourites"
        
        dump(favouriteCards)
        print("Favourites to display: ")
        dump(favouritesToDisplay)
        dump(favouritesToDisplay.count)
        
        
    }
    
    func loadUserDefaults()
    {
        if let tempDictionary = userDefaults.dictionary(forKey: "favouriteCards") as? [String: Bool]
        {
            favouriteCards = tempDictionary
        }
    }
    
    func retrieveFavourites()
    {
        for (key, value) in favouriteCards
        {
            if value == true
            {
                guard let valueToAdd = pokey.first(where: {$0.id == key}) else {return}
                
                favouritesToDisplay.append(valueToAdd)
            }
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        //return favouritesToDisplay.count
        return favouritesToDisplay.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "FavouritesTableViewCell", for: indexPath) as? FavouritesTableViewCell else {return UITableViewCell()}
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavouritesTableViewCell", for: indexPath) as? FavouritesTableViewCell else {return UITableViewCell()}

        let pok = favouritesToDisplay[indexPath.row]
        cell.setupUI(withDataFrom: pok)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 280
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
