//
//  thirdViewController.swift
//  mahjong_assistant2
//
//  Created by 平岡煌琉 on 2021/01/07.
//

import UIKit

class thirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var Label: UILabel!
    
    var yakunumber: Int = 0
    var score: Int = 0
    var honba: Int = 0
    var yakuArray0 = [String]()
    var yakuArray1 = [String]()
    var yakuArray2 = [String]()
    var yakuArray3 = [String]()
    var yakuArray4 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yakunumber = 0
        score = 0
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
        
        yakuArray0 = ["一飜役","二飜役","三飜役","六飜役"]
        
        yakuArray1 = ["立直","断么九", "門前清自摸和","役牌:自風牌","役牌:場風牌","役牌:白","役牌:發","役牌:中","平和","一盃口","槍槓","嶺上開花","海底摸月・河底撈魚","一発","燕返し(ローカル役)","槓振り(ローカル役)","十二落抬(ローカル役)"]
        
        yakuArray2 = ["ダブル立直","三槓子","小三元","混老頭","七対子","混全帯么九","三暗刻","一気通貫","三色同順(三色同刻)","五門斉(ローカル役)","三連刻(ローカル役)"]
        
        yakuArray3 = ["二盃口","純全帯么九","混一色","一色三順(ローカル役)"]
        
        yakuArray4 = ["清一色"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return yakuArray0.count
        }
    
    func tableView(_ tableView: UITableView,
                       titleForHeaderInSection section: Int) -> String? {
            return yakuArray0[section] as? String
        }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        if indexPath.section == 0 {
            yakunumber = yakunumber + 1
        } else if indexPath.section == 1 {
            yakunumber = yakunumber + 2
        } else if indexPath.section == 2 {
            yakunumber = yakunumber + 3
        } else if indexPath.section == 3 {
            yakunumber = yakunumber + 6
        }
        self.count()
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        
        cell?.accessoryType = .none
        if indexPath.section == 0 {
            yakunumber = yakunumber - 1
        } else if indexPath.section == 1 {
            yakunumber = yakunumber - 2
        } else if indexPath.section == 2 {
            yakunumber = yakunumber - 3
        } else if indexPath.section == 3 {
            yakunumber = yakunumber - 6
        }
        self.count()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return yakuArray1.count
        } else if section == 1 {
            return yakuArray2.count
        } else if section == 2 {
            return yakuArray3.count
        } else if section == 3 {
            return yakuArray4.count
        } else{
            return 10
        }
    }
    
    func count() {
        
        if yakunumber == 5 {
            score = 100 * honba + 8000
            Label.text = "満貫"
        } else if yakunumber >= 6 && yakunumber <= 7 {
            score = 100 * honba + 12000
            Label.text = "跳満"
        } else if yakunumber >= 8 && yakunumber <= 10 {
            score = 100 * honba + 16000
            Label.text = "倍満"
        } else if yakunumber >= 11 && yakunumber <= 12 {
            score = 100 * honba + 24000
            Label.text = "三倍満"
        } else if yakunumber >= 13 {
            score = 100 * honba + 32000
            Label.text = "数え役満"
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = String(describing: yakuArray1[indexPath.row])
        } else if indexPath.section == 1 {
            cell.textLabel?.text = String(describing: yakuArray2[indexPath.row])
        } else if indexPath.section == 2 {
            cell.textLabel?.text = String(describing: yakuArray3[indexPath.row])
        } else if indexPath.section == 3 {
            cell.textLabel?.text = String(describing: yakuArray4[indexPath.row])
        }
        return cell
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        if segue.identifier == "sendplayername" {
            let firstViewController = segue.destination as! firstViewController
            firstViewController.sentscore = self.score
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
