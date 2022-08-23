//
//  PokemonViewController.swift
//  PokemonList
//
//  Created by iMac on 2022-08-21.
//

import UIKit

class PokemonViewController: UIViewController
{
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    var pokey: [Card] = []
    let userDefaults = UserDefaults.standard
    var favouriteCards: [String: Bool] = [:]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Pokémon List"
        getPokemonData()
        loadUserDefaults()
        
        dump(favouriteCards)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        tableViewOutlet.reloadData()
        loadUserDefaults()
    }
    
    func loadUserDefaults()
    {
        if let tempDictionary = userDefaults.dictionary(forKey: "favouriteCards") as? [String: Bool]
        {
            favouriteCards = tempDictionary
        }
    }
    
    func getPokemonData()
    {
        let jsonUrl = "https://api.pokemontcg.io/v1/cards"
        //https://api.pokemontcg.io/v2/cards
        guard let url = URL(string: jsonUrl) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        URLSession(configuration: config).dataTask(with: request) { (myData, myResponse, myError) in
            
            if myError != nil
            {
                print((myError?.localizedDescription)!)
            }
            
            guard let data = myData else
            {
                print(myError as Any)
                return
            }
            
            do
            {
                let jsonData = try JSONDecoder().decode(Pokemon.self, from: data)
                print("jsonData: ", jsonData)
                self.pokey = jsonData.cards
                
                
                for pokemon in self.pokey
                {
                    if self.favouriteCards[pokemon.id] == nil
                    {
                        self.favouriteCards[pokemon.id] = false
                    }
                }
                self.userDefaults.set(self.favouriteCards, forKey: "favouriteCards")
                
                DispatchQueue.main.async
                {
                    self.tableViewOutlet.reloadData()
                }
                
            }catch
            {
                print("Error:::::: ", myError as Any)
            }
        }.resume()
        
    }
    
    
    @IBAction func addToFavouritesTapped(_ sender: Any)
    {
        let currentRow = tableViewOutlet.indexPathForSelectedRow?.row
        
        
        if favouriteCards[pokey[currentRow ?? 0].id] == false
        {
            favouriteCards[pokey[currentRow ?? 0].id] == true
        }
        else
        {
            favouriteCards[pokey[currentRow ?? 0].id] == false
        }
        
        print(favouriteCards[pokey[currentRow ?? 0].id])
        print(currentRow)
        
        userDefaults.set(favouriteCards, forKey: "favouriteCards")
        basicAlert(title: "Attention!", message: "Pokèmon successfully added to favourites!")
    }
     
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "detailID"
        {
            if let detailVC = segue.destination as? DetailViewController, let row = tableViewOutlet.indexPathForSelectedRow?.row
            {
                detailVC.pokemon = pokey[row]
            }
        }
        
        if segue.identifier == "favouritesID"
        {
            if let favouritesVC = segue.destination as? FavouritesTableViewController
            {
                favouritesVC.userDefaults = userDefaults
                favouritesVC.pokey = pokey
            }
        }
    }

}//end class

extension PokemonViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print("Pokey count: ", pokey.count)
        return pokey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokeyTableViewCell", for: indexPath) as? PokeyTableViewCell else {return UITableViewCell()}
        
        let pok = pokey[indexPath.row]
        cell.setupUI(withDataFrom: pok)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 280
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        <#code#>
    }
}

extension PokemonViewController
{
    func basicAlert(title: String?, message: String?)
    {
        DispatchQueue.main.async
        {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

