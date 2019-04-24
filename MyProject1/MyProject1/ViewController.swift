//
//  ViewController.swift
//  MyProject1
//
//  Created by Nakamura Tsukasa on 2019/04/18.
//  Copyright © 2019 Nakamura Tsukasa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func onButtonTap(_ sender: Any) {
        myTextField.text = "タップされました"
    }
    @IBOutlet weak var myTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

