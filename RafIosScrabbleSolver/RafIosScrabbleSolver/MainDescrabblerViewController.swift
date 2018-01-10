//
//  Page2ScrabblerViewController.swift
//  RafIosScrabbleSolver
//
//  Created by Volare on 16/09/2017.
//  Copyright © 2017 Gensys Telerik. All rights reserved.
//

import UIKit

class MainDescrabblerViewController: UIViewController,UITextFieldDelegate, UITableViewDelegate,UITableViewDataSource {
    var items:[(String,Int) ] = []
    var groupedItems:[Int:[String]] = [:]
    var keys:[Int] { return [Int](groupedItems.keys).sorted {
        a,b in a > b
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupedItems.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Score: \(keys[section])"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(groupedItems[keys[section]]!.count)
        return groupedItems[keys[section]]!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let key = keys[indexPath.section]
        cell.textLabel?.text = (groupedItems[key]!)[indexPath.row]
        return cell
    }
    
    @IBAction func btnGenerateAction(_ sender: Any) {
        
        let path = Bundle.main.path(forResource: "ospd", ofType: "txt")
        let ospdTxt = try! String(contentsOfFile: path!)
        var words = ospdTxt.components(separatedBy: "\n")
        words = words.filter {
            $0.strlen <= 21
        }
        
        
        let myword = (tfWord?.text)!
        var matches:[(String,Int)] = []
        for line in words {
            var isValid = true
            var charsBuffer = myword.charComponents()
            for char in line.lowercased().charComponents() {
                if charsBuffer.contains(char) {
                    //            print("\(line) \(char) \(charsBuffer)")
                    charsBuffer.remove(at:charsBuffer.index(of: char)!)
                } else { isValid = false; break }
            }
            if isValid {
                matches.append((line.lowercased(),Scrabble.getWordScore(forString: line)))
            }
        }
        
                matches.sorted {$0.1 > $1.1}.forEach{ print("\($0.0) -> \($0.1)")}
        items.removeAll()
        matches.sorted {$0.1 > $1.1}.forEach{ items.append(($0.0, $0.1))}
        
        groupedItems.removeAll()
        
        matches.forEach({
            item in
            var value = groupedItems[item.1] ?? []
            value.append(item.0)
            groupedItems.updateValue(value, forKey: item.1)
        })
        print(groupedItems)
        myTableView.reloadData()
        myTableView.setNeedsDisplay()
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 21
        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    @IBOutlet weak var tfWord: UITextField!
    @IBOutlet weak var btnGenerate: UIButton!
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tfWord.delegate = self
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
