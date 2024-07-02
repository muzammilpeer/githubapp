//
//  AppDelegate.swift
//  GithubApp
//
//  Created by Muzammil Peer on 23/06/2024.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

@main
class AppDelegate: FlutterAppDelegate {

    var flutterEngine: FlutterEngine?
    var flutterViewController:FlutterViewController?


    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func bootFlutter() {
        if flutterEngine != nil {
            flutterEngine = nil
        }
        flutterEngine = FlutterEngine(name: "my flutter engine")
        flutterEngine?.run()
        GeneratedPluginRegistrant.register(with: flutterEngine!)
    }
    
    func buildFlutterViewController() {
        bootFlutter()
        if flutterViewController == nil {
            flutterViewController = FlutterViewController(engine: (UIApplication.shared.delegate as! AppDelegate).flutterEngine!, nibName: nil, bundle: nil)
            sendDataToFlutter(controller: flutterViewController!)
        }
    }

    

    private func sendDataToFlutter(controller:FlutterViewController){
        let channel = FlutterMethodChannel(name: "simple",
                                           binaryMessenger: controller.binaryMessenger)
        
        channel.setMethodCallHandler { [weak self] (call, result) in
            if call.method == "listUsers" {
                print("i am called")
                self?.sendData(result: result)
            }else if call.method == "backToNative" {
                print("backToNative called")

                self?.handleBackToNative()
                result(nil)
            }
            else {
                result(FlutterMethodNotImplemented)
            }
        }
    }
    private func handleBackToNative() {
        // Handle the back button press event here
        print("Back button pressed in Flutter, handled in iOS")
        let navigationController:UINavigationController? = self.window?.rootViewController as? UINavigationController
        navigationController?.popToRootViewController(animated: true)
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

