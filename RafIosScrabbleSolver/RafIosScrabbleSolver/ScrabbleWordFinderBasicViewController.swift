//
//  ScrabbleWordFinderBasicViewController.swift
//  RafIosScrabbleSolver
//
//  Created by Volare on 16/09/2017.
//  Copyright © 2017 Gensys Telerik. All rights reserved.
//

import UIKit

class MyTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var items:[String]! = ["foo","bar"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override var numberOfSections: Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}


class ScrabbleWordFinderBasicViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var tableView:UITableView
//        tableView = MyTableView(frame: self.view.frame)
        tableView = MyTableView()
        tableView.delegate = tableView as? UITableViewDelegate
        tableView.dataSource = tableView as? UITableViewDataSource
        
        let tf = UITextField(frame: self.view.frame)
        let btn = UIButton()
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 7
        btn.setTitle("Load", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.blue
        tf.borderStyle = .roundedRect
        tf.placeholder = "Input"
        tf.translatesAutoresizingMaskIntoConstraints = false
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        navBar.translatesAutoresizingMaskIntoConstraints = false
        navBar.barStyle = .default
        
        let navItem = UINavigationItem(title: "Foobar")
        navBar.setItems([navItem], animated: true)
        
        self.view.addSubview(navBar)
        self.view.addSubview(tf)
        self.view.addSubview(btn)
        self.view.addSubview(tableView)
        let screenMargins = self.view.layoutMarginsGuide
        //        navBarMarginsGuide.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        
        navBar.topAnchor.constraint(equalTo: screenMargins.topAnchor).isActive = true
        tf.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        
        tf.leftAnchor.constraint(equalTo: screenMargins.leftAnchor).isActive = true
        tf.rightAnchor.constraint(equalTo: screenMargins.rightAnchor).isActive = true
        btn.topAnchor.constraint(equalTo: tf.bottomAnchor).isActive = true
        btn.rightAnchor.constraint(equalTo: screenMargins.rightAnchor).isActive = true
        btn.leftAnchor.constraint(equalTo: screenMargins.leftAnchor).isActive = true
        
//        tableView.topAnchor.constraint(equalTo: btn.topAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: screenMargins.bottomAnchor).isActive = true
        
//        tableView.frame.origin = CGPoint(x: 0, y: btn.frame.origin.y)
        //        self.view.addSubview(tableView)
        
        // Do any additional setup after loading the view.
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
