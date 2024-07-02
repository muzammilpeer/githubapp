//
//  ViewController.swift
//  GithubApp
//
//  Created by Muzammil Peer on 23/06/2024.
//

import UIKit
import Flutter


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create a FlutterViewController.
    }

    @IBAction func actionOpenRepositories(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.bootFlutter()
        let flutterViewController = FlutterViewController(engine: (UIApplication.shared.delegate as! AppDelegate).flutterEngine, nibName: nil, bundle: nil)
        sendDataToFlutter(controller: flutterViewController)

        // Create a transition animation
        let transition = CATransition()
        transition.duration = 0.5 // Duration of the transition
        transition.type = .fade // Type of transition (e.g., fade, push, moveIn, reveal)
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        // Apply the transition to the window
        appDelegate.window?.layer.add(transition, forKey: kCATransition)
        
        // Set the new root view controller with the transition
        appDelegate.window?.rootViewController = flutterViewController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    private func sendDataToFlutter(controller:FlutterViewController){
        let channel = FlutterMethodChannel(name: "uk.muzammilpeer.github_deatil/data",
                                           binaryMessenger: controller.binaryMessenger)
        
        channel.setMethodCallHandler { [weak self] (call, result) in
            if call.method == "getData" {
                print("i am called")
                self?.sendData(result: result)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
    }
    
    private func sendData(result: FlutterResult) {
        let data: [[String: String]] = [
            [
                "userName": "muzammilpeer",
                "name": "Muzammil Peer",
                "avatarUrl": "https://avatars.githubusercontent.com/u/859865?v=4",
                "email": ""
            ],
            [
                "userName": "taharafiq",
                "name": "Taha Rafiq",
                "avatarUrl": "https://avatars.githubusercontent.com/u/338262?v=4",
                "email": ""
            ],
            [
                "userName": "abmussani",
                "name": "Abdul Basit",
                "avatarUrl": "https://avatars.githubusercontent.com/u/5653562?v=4",
                "email": ""
            ]
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                result(jsonString)
            } else {
                result(FlutterError(code: "JSON_ERROR", message: "Unable to encode JSON string", details: nil))
            }
        } catch {
            result(FlutterError(code: "JSON_ERROR", message: "Unable to serialize JSON", details: nil))
        }
    }
 
}

