//
//  ViewController.swift
//  [1]Calculator
//
//  Created by 김동준 on 11/22/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var numberLabel: UILabel!

    var textManager = TextChangeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setup()
        
        numberLabel.text = "0"
    }

    func setup() {
        numberLabel.lineBreakMode = .byTruncatingHead
    }
    
    @IBAction func numberBtnPressed(_ sender: UIButton) {
        let number = sender.tag - 10
        guard let label = numberLabel.text else { return }
        
        numberLabel.text = textManager.addText(label, number)
    }
    
    @IBAction func deleteBtnPressed(_ sender: UIButton) {
        guard let label = numberLabel.text else { return }
        
        numberLabel.text = textManager.removeText(label)
    }
}
