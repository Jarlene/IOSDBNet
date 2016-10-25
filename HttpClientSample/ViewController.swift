//
//  ViewController.swift
//  HttpClientSample
//
//  Created by Jarlene on 2016/10/21.
//  Copyright © 2016年 Jarlene. All rights reserved.
//

import UIKit
import NetJson

class ViewController: BaseViewController {

    @IBOutlet weak var urlEdit: UITextField!
    @IBOutlet weak var semdButton: UIButton!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

   
    @IBAction func requestAction(_ sender: AnyObject) {
        let url = urlEdit.text
        let request = Request(url: url!, type: .Get)
            .setType(value: "json")
            .addParam(key: "plat", value: "android")
            .addParam(key: "appKey", value: "23282028")
            .addParam(key: "aa", value: "ffff")
        getNetData(request: request, callback: { res in
            if let result = res.toJson() {
                self.result.text = result.dictionary?["appLinkConfig"]?.dictionaryObject?["taobao_scheme"] as? String
                NSLog("\(result.debugDescription)")
                return result as AnyObject
            }
            return  nil
        })
    }
}

