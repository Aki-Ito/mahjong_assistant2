//
//  secondViewController.swift
//  mahjong_assistant2
//
//  Created by 平岡煌琉 on 2021/01/07.
//

import UIKit

class secondViewController: UIViewController {
    
    @IBOutlet weak var player1name: UITextField!
    @IBOutlet weak var player2name: UITextField!
    @IBOutlet weak var player3name: UITextField!
    @IBOutlet weak var player4name: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var ieArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    @IBAction func OKbutton() {
        override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
            if segue.identifier == "sendplayername" {
                let firstViewController = segue.destination as! firstViewController
                firstViewController.player1name = self.player1name
                firstViewController.player2name = self.player2name
                firstViewController.player3name = self.player3name
                firstViewController.player4name = self.player4name
            }
        }

        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
            realm.add(playername)
            })
        }catch{
        }
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
