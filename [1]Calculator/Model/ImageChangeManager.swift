//
//  ImageChangeManager.swift
//  [1]Calculator
//
//  Created by 김동준 on 12/5/24.
//

import UIKit

struct ImageChangeManager {
    func changeImage(_ button: UIButton, _ label: UILabel) {
        let originalImage = UIImage(named: "deleteButton")
        let changedImage = originalImage?.resize(size: CGSize(width: 50, height: 50))?.withTintColor(.white)
        
        if label.text != "0" {
            button.setTitle("", for: .normal)
            button.setImage(changedImage, for: .normal)
        } else {
            button.setTitle("AC", for: .normal)
            button.setImage(nil, for: .normal)
        }
    }
}

