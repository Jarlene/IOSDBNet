//
//  BaseViewController.swift
//  HttpClientSample
//
//  Created by Jarlene on 2016/10/21.
//  Copyright © 2016年 Jarlene. All rights reserved.
//

import Foundation
import UIKit
import NetJson

/**
 * 基础ViewController
 * 将在此Controller中
 * 封装网络请求，网络变化，刷新数据等功能，数据库变化等功能。
 *
 */
class BaseViewController: UIViewController, NotifyChangedListener {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 添加网络状态监听
        SwiftNetwork.getInstance().registerNetChangeListener(listener: self)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // 移除网络状态监听
        SwiftNetwork.getInstance().unregisterNetChangeListener(listener: self)
    }
    
    
    /**
     * 从网络拉取数据，之后通知到主线程
     * - Parameter request: 请求参数
     * - Parameter resopnse: 回调闭包
     * - Returns: void
     */
    func getNetData(request: SwiftRequest?, callback: @escaping (SwiftResponse)-> AnyObject? )  {
        if let request = request {
            let httpClient = SwiftHttpClient.getInstance();
            httpClient.send(request: request, response: callback)
        }
    }
    
    
    /**
     * 从数据库获取数据
     * - Parameter uri: 指向数据库的uri
     * - Parameter callback: 获取数据的回调，可选函数类型
     * - Returns: void
     */
    func getDataBase(uri: String, callback: @escaping (SwiftResponse)-> AnyObject??)  {
        if !uri.isEmpty {
            
        }
        
    }
    
    
    /**
     * 网络状态改变监听
     * - Parameter status: NetworkStatus网络状态
     */
    func notify(status: NetworkStatus?) {
        guard let netStatus = status else {
            return
        }
        print(netStatus.description)
    }
    
    
}
