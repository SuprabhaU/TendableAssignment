//
//  ViewController.swift
//  AsgntTendable
//
//  Created by Suprabha Dhavan on 30/07/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc : UIViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as UIViewController
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
            }
        // Do any additional setup after loading the view.
    }


}

