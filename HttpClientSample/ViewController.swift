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

    /**
     * 从网络拉取数据，之后通知到主线程
     * - Parameter request: 请求参数
     * - Parameter resopnse: 回调闭包
     * - Returns: void
     */
    func getData(request: Request?, resopnse: @escaping (Responese)-> Void )  {
        if let request = request {
            let httpClient = HttpClient();
            httpClient.send(request: request, response: resopnse)
        }
    }

    @IBAction func requestAction(_ sender: AnyObject) {
        let url = urlEdit.text
        let request = Request(url: url!, type: .Get)
        getData(request: request, resopnse: { res in
            if let result = res.result {
                self.result.text =  result
            }
 
        })
    }
}

