//
//  main.swift
//  JHURLRequest
//
//  Created by HaoCold on 2021/12/16.
//

import Foundation

print("Hello, World!")

func test1() {
    let url = "https://httpbin.org/get"
    let dic: [String: Any] = [
        "name": "Lilei",
        "age": 18,
        "gender": "male",
        "height": 1.80,
        "happy": true
    ]
    let req = URLRequest.jh_request(url, params: dic)

    URLSession.shared.dataTask(with: req!) { (data, response, error) in
        guard let data = data else {
            print("data is nil")
            return
        }

        guard let dict = try? JSONSerialization.jsonObject(with: data, options: []) else {
            print("data to dict failed!")
            return
        }
        
        print("response data = ", dict)
    }.resume()
}

//response data =  {
//    args =     {
//        age = 18;
//        gender = male;
//        happy = true;
//        height = "1.8";
//        name = Lilei;
//    };
//    headers =     {
//        Accept = "*/*";
//        "Accept-Encoding" = "gzip, deflate, br";
//        "Accept-Language" = "zh-cn";
//        Host = "httpbin.org";
//        "User-Agent" = "JHURLRequest (unknown version) CFNetwork/1240.0.4 Darwin/20.6.0";
//        "X-Amzn-Trace-Id" = "Root=1-61bad2a0-53a42fc851443bf2255ba4b4";
//    };
//    origin = "183.14.31.95";
//    url = "https://httpbin.org/get?name=Lilei&gender=male&height=1.8&happy=true&age=18";
//}

func test2() {
    let url = "https://httpbin.org/post"
    let dic: [String: Any] = [
        "name": "Lilei",
        "age": 18,
        "gender": "male",
        "height": 1.80,
        "happy": true
    ]
    let req = URLRequest.jh_request(url, params: dic, method: .POST)

    URLSession.shared.dataTask(with: req!) { (data, response, error) in
        guard let data = data else {
            print("data is nil")
            return
        }

        guard let dict = try? JSONSerialization.jsonObject(with: data, options: []) else {
            print("data to dict failed!")
            return
        }
        
        print("response data = ", dict)
    }.resume()
}

//response data =  {
//    args =     {
//    };
//    data = "";
//    files =     {
//    };
//    form =     {
//        age = 18;
//        gender = male;
//        happy = true;
//        height = "1.8";
//        name = Lilei;
//    };
//    headers =     {
//        Accept = "*/*";
//        "Accept-Encoding" = "gzip, deflate, br";
//        "Accept-Language" = "zh-cn";
//        "Content-Length" = 51;
//        "Content-Type" = "application/x-www-form-urlencoded";
//        Host = "httpbin.org";
//        "User-Agent" = "JHURLRequest (unknown version) CFNetwork/1240.0.4 Darwin/20.6.0";
//        "X-Amzn-Trace-Id" = "Root=1-61bad2a0-14c273b41bd60df45183ff98";
//    };
//    json = "<null>";
//    origin = "183.14.31.95";
//    url = "https://httpbin.org/post";
//}

test1()
test2()

RunLoop.current.run()
