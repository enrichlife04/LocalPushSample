//
//  ViewController.swift
//  LocalPushSample
//
//  Created by Koichi Muranaka on 2021/01/02.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("")
    }

    @IBAction func pushButton(_ sender: Any) {
        
        //プッシュ通知のインスタンス
        let notification = UNMutableNotificationContent()
        //通知のタイトル
        notification.title = textField.text!
        //通知の本文
        notification.body = "これはプッシュ通知です"
        //通知の音
        notification.sound = UNNotificationSound.default
        
        //ナビゲータエリア(ファイルが載っている左)にある画像を指定
        if let path = Bundle.main.path(forResource: "猫", ofType: "png") {
            
            //通知に画像を設定
            notification.attachments = [try! UNNotificationAttachment(identifier: "ID",
                                                url: URL(fileURLWithPath: path), options: nil)]
            
        }
        
        //通知タイミングを指定(今回は5秒ご)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        //通知のリクエスト
        let request = UNNotificationRequest(identifier: "ID", content: notification,
                                            trigger: trigger)
        //通知を実装
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
}
