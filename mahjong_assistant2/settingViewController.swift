//
//  settingViewController.swift
//  mahjong_assistant2
//
//  Created by 平岡煌琉 on 2021/01/07.
//

import UIKit

class settingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView2: UITableView!
    @IBOutlet var player1name: UILabel!
    @IBOutlet var player2name: UILabel!
    @IBOutlet var player3name: UILabel!
    @IBOutlet var player4name: UILabel!
    
    var playernameArray = [String]()
    var Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView2.delegate = self
        tableView2.dataSource = self
        tableView2.allowsMultipleSelection = true
        
        playernameArray = ["\(player1name)","\(player2name)","\(player3name)","\(player4name)"]
        Array = ["聴牌","立直"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func  numberOfSections(in tableView: UITableView) -> Int {
        return Array.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array[section] as? String
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playernameArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(playernameArray[indexPath.row])"
        if indexPath.section == 0 {
            cell.textLabel?.text = String(describing: playernameArray[indexPath.row])
        } else if indexPath.section == 1 {
            cell.textLabel?.text = String(describing: playernameArray[indexPath.row])
        }
        return cell
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
