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
//UIResponder, UIApplicationDelegate,
class AppDelegate: FlutterAppDelegate {

    lazy var flutterEngine = FlutterEngine(name: "my flutter engine")


    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
//        // Run the Flutter engine
//        flutterEngine.run()
//        
//        GeneratedPluginRegistrant.register(with: self.flutterEngine)
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func bootFlutter() {
        // Run the Flutter engine
        flutterEngine.run()
        
        GeneratedPluginRegistrant.register(with: self.flutterEngine)
    }
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//        return true
//    }

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

