//
//  ViewController.swift
//  [1]Calculator
//
//  Created by 김동준 on 11/22/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var deleteButton: UIButton!
    
    var textManager = TextChangeManager()
    var imageChangeManager = ImageChangeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setup()
    }

    func setup() {
        numberLabel.lineBreakMode = .byTruncatingHead
        numberLabel.text = "0"
       
    }
    
    @IBAction func numberBtnPressed(_ sender: UIButton) {
        let number = sender.tag - 10
        guard let label = numberLabel.text else { return }
        
        numberLabel.text = textManager.addText(label, number)
        imageChangeManager.changeImage(deleteButton, numberLabel)
    }
    
    @IBAction func deleteBtnPressed(_ sender: UIButton) {
        guard let label = numberLabel.text else { return }
        
        numberLabel.text = textManager.removeText(label)
        imageChangeManager.changeImage(deleteButton, numberLabel)
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI

#Preview("Sample") {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
    
    vc.toPreview()
}
#endif



