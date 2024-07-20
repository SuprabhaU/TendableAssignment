//
//  NetworkManager.swift
//  AsgntTendable
//
//  Created by Suprabha Dhavan on 30/07/24.
//

import UIKit

class NetworkManager {
     public func getAreas(
        completion: @escaping (Result<[Area], Error>) -> ()
        )  {
            let url = URL(string: "http://localhost:5001/api/generate_random_inspections/")!
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, _,error in
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode([Area].self, from: data)
                        completion(.success(result))
                    } catch {
                        print(error.localizedDescription)
                        completion(.failure(error))
                    }
                }
            }
            task.resume()
        }
    public func getCategorys(
        completion: @escaping (Result<[Category], Error>) -> ()
        )  {
            let url = URL(string: "http://localhost:5001/api/random_inspection")!
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, _,error in
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode([Category].self, from: data)
                        completion(.success(result))
                    } catch {
                        print(error.localizedDescription)
                        completion(.failure(error))
                    }
                }
            }
            task.resume()
        }
    public func getInspections(
        completion: @escaping (Result<[Inspection], Error>) -> ()
        )  {
            let url = URL(string: "http://localhost:5001/api/inspections/")!
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, _,error in
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode([Inspection].self, from: data)
                        completion(.success(result))
                    } catch {
                        print(error.localizedDescription)
                        completion(.failure(error))
                    }
                }
            }
            task.resume()
        }
    public func getQuestions(
        completion: @escaping (Result<[Question], Error>) -> ()
        )  {
            let url = URL(string: "http://localhost:5001/api/inspections/")!
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, _,error in
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode([Question].self, from: data)
                        completion(.success(result))
                    } catch {
                        print(error.localizedDescription)
                        completion(.failure(error))
                    }
                }
            }
            task.resume()
        }   
    
    public func getRadomQuestions(
        completion: @escaping (Result<[Question], Error>) -> ()
        )  {
            let url = URL(string: "http://localhost:5001/api/generate_random_inspection/")!
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, _,error in
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode([Question].self, from: data)
                        completion(.success(result))
                    } catch {
                        print(error.localizedDescription)
                        completion(.failure(error))
                    }
                }
            }
            task.resume()
        }
    
    public func getSubmit(idStr:String,nameStr:String,urlStr:String){
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)

            let params = ["id":idStr, "name":nameStr] as Dictionary<String, AnyObject>

        let urlString = NSString(format: urlStr as NSString)
            let request : NSMutableURLRequest = NSMutableURLRequest()
        request.url = URL(string: NSString(format: "%@", urlString)as String)
        request.httpMethod = "POST"
            request.timeoutInterval = 30
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody  = try! JSONSerialization.data(withJSONObject: params, options: [])
        let dataTask = session.dataTask(with: NSURL(string: urlString as String)! as URL) { data, response, error in
                    // 1: Check HTTP Response for successful GET request
            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                        else {
                            print("error: not a valid http response")
                            return
                    }

                    switch (httpResponse.statusCode)
                    {
                    case 200:

                        let response = NSString (data: receivedData as Data, encoding: NSUTF8StringEncoding)


                        if response == "SUCCESS"
                        {

                        }
                    case 400:

                        let response = NSString (data: receivedData as Data, encoding: NSUTF8StringEncoding)


                        if response == "MISSING"
                        {

                        }
                    case 401:

                        let response = NSString (data: receivedData as Data, encoding: NSUTF8StringEncoding)


                        if response == "INVALID"
                        {

                        }
                    default:
                        print("POST request got response \(httpResponse.statusCode)")
                    }
            }
            dataTask.resume()
    }
    public func getStarted(
        completion: @escaping (Result<[Question], Error>) -> ()
        )  {
            let url = URL(string: "http://localhost:5001/api/inspections/start/")!
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, _,error in
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode([Question].self, from: data)
                        completion(.success(result))
                    } catch {
                        print(error.localizedDescription)
                        completion(.failure(error))
                    }
                }
            }
            task.resume()
        }
    
    
    
    
    
    public func getLogin(username:String,password:String,urlStr:String){
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)

            let params = ["username":username, "password":password] as Dictionary<String, AnyObject>

        let urlString = NSString(format: urlStr as NSString)
            let request : NSMutableURLRequest = NSMutableURLRequest()
        request.url = URL(string: NSString(format: "%@", urlString)as String)
        request.httpMethod = "POST"
            request.timeoutInterval = 30
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody  = try! JSONSerialization.data(withJSONObject: params, options: [])
        let dataTask = session.dataTask(with: NSURL(string: urlString as String)! as URL) { data, response, error in
                    // 1: Check HTTP Response for successful GET request
            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                        else {
                            print("error: not a valid http response")
                            return
                    }

                    switch (httpResponse.statusCode)
                    {
                    case 200:

                        let response = NSString (data: receivedData as Data, encoding: NSUTF8StringEncoding)


                        if response == "SUCCESS"
                        {

                        }
                    case 400:

                        let response = NSString (data: receivedData as Data, encoding: NSUTF8StringEncoding)


                        if response == "MISSING"
                        {

                        }
                    case 401:

                        let response = NSString (data: receivedData as Data, encoding: NSUTF8StringEncoding)


                        if response == "INVALID"
                        {

                        }
                    default:
                        print("POST request got response \(httpResponse.statusCode)")
                    }
            }
            dataTask.resume()
    }
    public func getRegister(username:String,password:String,urlStr:String){
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)

            let params = ["username":username, "password":password] as Dictionary<String, AnyObject>

        let urlString = NSString(format: urlStr as NSString)
            let request : NSMutableURLRequest = NSMutableURLRequest()
        request.url = URL(string: NSString(format: "%@", urlString)as String)
        request.httpMethod = "POST"
            request.timeoutInterval = 30
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody  = try! JSONSerialization.data(withJSONObject: params, options: [])
        let dataTask = session.dataTask(with: NSURL(string: urlString as String)! as URL) { data, response, error in
                    // 1: Check HTTP Response for successful GET request
            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                        else {
                            print("error: not a valid http response")
                            return
                    }

                    switch (httpResponse.statusCode)
                    {
                    case 200:

                        let response = NSString (data: receivedData as Data, encoding: NSUTF8StringEncoding)


                        if response == "SUCCESS"
                        {

                        }
                    case 400:

                        let response = NSString (data: receivedData as Data, encoding: NSUTF8StringEncoding)


                        if response == "MISSING"
                        {

                        }
                    case 401:

                        let response = NSString (data: receivedData as Data, encoding: NSUTF8StringEncoding)


                        if response == "ALREADY PRESENT"
                        {

                        }
                    default:
                        print("POST request got response \(httpResponse.statusCode)")
                    }
            }
            dataTask.resume()
    }
}
