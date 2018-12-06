//
//  NetworkTools.swift
//  06-AFNetworking的封装
//
//  Created by xiaomage on 16/4/6.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import Alamofire

// 定义枚举类型
enum RequestType : String {
    case GET = "GET"
    case POST = "POST"
}

class NetworkTools {
    // let是线程安全的
    static let shareInstance : NetworkTools = {
        let tools = NetworkTools()
    //    tools.responseSerializer.acceptableContentTypes?.insert("text/html")
     //   tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tools
    }()
}

// MARK:- 封装请求方法
extension NetworkTools {
    /// 请求数据的封装
    ///   - methodType: 请求类型
    ///   - urlString: URL地址
    ///   - parameters: 请求参数
    ///   - finished: 请求结果返回的回调
    func requestWBData(methodType : RequestType, parameters : [String : AnyObject], finished : @escaping (_ result : AnyObject?, _ error : NSError?) -> ()) -> () {
        var  wbDataModelArray = [WBDataInfoModel]()
        if methodType == .GET{
            Alamofire.request(requestWeiboUrl, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
                if let jsondata = response.result.value {
                   let WBDataDic =   jsondata as! Dictionary<String,AnyObject>
                    let WBDataArray  = WBDataDic["statuses"] as! [[String:AnyObject]];
                    for  dic: [String:AnyObject] in WBDataArray {
                        let wbDataModel = WBDataInfoModel(wbDataDic: dic)
                        wbDataModelArray.append(wbDataModel)
                    }
                    finished(wbDataModelArray as AnyObject,nil)
                }
            }
        }
}
    //请求用户数据
    func requestUserData(methodType : RequestType,  parameters : [String : AnyObject], finished : @escaping (_ result : AnyObject?, _ error : NSError?) -> ()) -> () {
           if methodType == .GET{
            Alamofire.request(requestUserInfoUrl, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
                if let json = response.result.value {
                    let userDic = json as? Dictionary<String, AnyObject>
                    let userInfoModel = UserInfoModel(userDic: userDic!)
                    print(json)
                    finished(userInfoModel as AnyObject,nil)
                }
            }
        }
    }
//    func request(methodType : RequestType, urlString : String, parameters : [String : AnyObject], finished : (result : AnyObject?, _ error : NSError?) -> ()) {
//
//        // 1.定义成功的回调闭包
//        let successCallBack = { (task : NSURLSessionDataTask, result : AnyObject?) -> Void in
//            finished(result: result, error: nil)
//        }
//
//        // 2.定义失败的回调闭包
//        let failureCallBack = { (task : NSURLSessionDataTask?, error : NSError) -> Void in
//            finished(result: nil, error: error)
//        }
//
//        // 3.发送网络请求
//        if methodType == .GET {
//            GET(urlString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
//        } else {
//            POST(urlString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
//        }
//
   // }
}

/*

// MARK:- 请求AccessToken
extension NetworkTools {
    func loadAccessToken(code : String, finished : (result : [String : AnyObject]?, error : NSError?) -> ()) {
        // 1.获取请求的URLString
        let urlString = "https://api.weibo.com/oauth2/access_token"
        
        // 2.获取请求的参数
        let parameters = ["client_id" : app_key, "client_secret" : app_secret, "grant_type" : "authorization_code", "redirect_uri" : redirect_uri, "code" : code]
        
        // 3.发送网络请求
        request(.POST, urlString: urlString, parameters: parameters) { (result, error) -> () in
            finished(result: result as? [String : AnyObject], error: error)
        }
    }
}


// MARK:- 请求用户的信息
extension NetworkTools {
    func loadUserInfo(access_token : String, uid : String, finished : (result : [String : AnyObject]?, error : NSError?) -> ()) {
        // 1.获取请求的URLString
        let urlString = "https://api.weibo.com/2/users/show.json"
        
        // 2.获取请求的参数
        let parameters = ["access_token" : access_token, "uid" : uid]
        
        // 3.发送网络请求
        request(.GET, urlString: urlString, parameters: parameters) { (result, error) -> () in
            finished(result: result as? [String : AnyObject] , error: error)
        }
    }
}


// MARK:- 请求首页数据
extension NetworkTools {
    func loadStatuses(since_id : Int, max_id : Int, finished : (result : [[String : AnyObject]]?, error : NSError?) -> ()) {
        // 1.获取请求的URLString
        let urlString = "https://api.weibo.com/2/statuses/home_timeline.json"
        
        // 2.获取请求的参数
        let accessToken = (UserAccountViewModel.shareIntance.account?.access_token)!
        let parameters = ["access_token" : accessToken, "since_id" : "\(since_id)", "max_id" : "\(max_id)"]
        
        // 3.发送网络请求
        request(.GET, urlString: urlString, parameters: parameters) { (result, error) -> () in
            
            // 1.获取字典的数据
            guard let resultDict = result as? [String : AnyObject] else {
                finished(result: nil, error: error)
                return
            }
            
            // 2.将数组数据回调给外界控制器
            finished(result: resultDict["statuses"] as? [[String : AnyObject]], error: error)
        }
    }
}


// MARK:- 发送微博
extension NetworkTools {
    func sendStatus(statusText : String, isSuccess : (isSuccess : Bool) -> ()) {
        // 1.获取请求的URLString
        let urlString = "https://api.weibo.com/2/statuses/update.json"
        
        // 2.获取请求的参数
        let parameters = ["access_token" : (UserAccountViewModel.shareIntance.account?.access_token)!, "status" : statusText]
        
        // 3.发送网络请求
        request(.POST, urlString: urlString, parameters: parameters) { (result, error) -> () in
            if result != nil {
                isSuccess(isSuccess: true)
            } else {
                isSuccess(isSuccess: false)
            }
        }
    }
}


// MARK:- 发送微博并且携带照片
extension NetworkTools {
    func sendStatus(statusText : String, image : UIImage, isSuccess : (isSuccess : Bool) -> ()) {
        // 1.获取请求的URLString
        let urlString = "https://api.weibo.com/2/statuses/upload.json"
        
        // 2.获取请求的参数
        let parameters = ["access_token" : (UserAccountViewModel.shareIntance.account?.access_token)!, "status" : statusText]
        
        // 3.发送网络请求
        POST(urlString, parameters: parameters, constructingBodyWithBlock: { (formData) -> Void in
            
            if let imageData = UIImageJPEGRepresentation(image, 0.5) {
                formData.appendPartWithFileData(imageData, name: "pic", fileName: "123.png", mimeType: "image/png")
            }
            
            }, progress: nil, success: { (_, _) -> Void in
                isSuccess(isSuccess: true)
            }) { (_, error) -> Void in
                print(error)
        }
    }
}

*/







