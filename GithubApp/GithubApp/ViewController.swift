//
//  ViewController.swift
//  GithubApp
//
//  Created by Muzammil Peer on 23/06/2024.
//

import UIKit
import Flutter


class ViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Restore navigation bar visibility if returning from FlutterViewController
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create a FlutterViewController.
    }

    @IBAction func actionOpenRepositories(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.buildFlutterViewController()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.pushViewController(appDelegate.flutterViewController!, animated: true)
    }
    

}

