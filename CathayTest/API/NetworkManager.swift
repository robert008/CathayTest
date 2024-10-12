//
//  NetworkManager.swift
//  CathayTest
//
//  Created by tinghui Chuang on 2024/10/9.
//

import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchNotificationList(from urlString: String, completion: @escaping (Bool,[Messages]?,String) -> Void) {
        var list : [Messages] = []
        
        guard let url = URL(string: urlString) else {
//            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            completion(false,list, "Invalid URL")

            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(false,list, error.localizedDescription)
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                let statusError = NSError(domain: "HTTP Error", code: httpResponse.statusCode, userInfo: nil)
                completion(false,list, statusError.localizedDescription)
                return
            }
            
            guard let data = data else {
                completion(false,list, "No Data")
                return
            }

            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(Json4Swift_Base.self, from: data)
                list = model.result?.messages ?? []
                completion(true,list, "success")
            } catch {
                completion(false,list, "Json decode failed")
            }
        }
        
        task.resume()
    }

    
    func fetchDigitalList(from urlString: String, completion: @escaping (Bool,[DigitalList]?,String) -> Void) {
        var list : [DigitalList] = []
        
        guard let url = URL(string: urlString) else {
//            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            completion(false,list, "Invalid URL")

            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(false,list, error.localizedDescription)
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                let statusError = NSError(domain: "HTTP Error", code: httpResponse.statusCode, userInfo: nil)
                completion(false,list, statusError.localizedDescription)
                return
            }
            
            guard let data = data else {
                completion(false,list, "No Data")
                return
            }

            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(Json4Swift_Base.self, from: data)
                list = model.result?.digitalList ?? []
                completion(true,list, "success")
            } catch {
                completion(false,list, "Json decode failed")
            }
        }
        
        task.resume()
    }

    
    func fetchDepositList(from urlString: String, completion: @escaping (Bool,[FixedDepositList]?,String) -> Void) {
        var list : [FixedDepositList] = []
        
        guard let url = URL(string: urlString) else {
//            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            completion(false,list, "Invalid URL")

            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(false,list, error.localizedDescription)
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                let statusError = NSError(domain: "HTTP Error", code: httpResponse.statusCode, userInfo: nil)
                completion(false,list, statusError.localizedDescription)
                return
            }
            
            guard let data = data else {
                completion(false,list, "No Data")
                return
            }

            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(Json4Swift_Base.self, from: data)
                list = model.result?.fixedDepositList ?? []
                completion(true,list, "success")
            } catch {
                completion(false,list, "Json decode failed")
            }
        }
        
        task.resume()
    }


    func fetchSavingList(from urlString: String, completion: @escaping (Bool,[SavingsList]?,String) -> Void) {
        var list : [SavingsList] = []
        
        guard let url = URL(string: urlString) else {
//            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            completion(false,list, "Invalid URL")

            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(false,list, error.localizedDescription)
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                let statusError = NSError(domain: "HTTP Error", code: httpResponse.statusCode, userInfo: nil)
                completion(false,list, statusError.localizedDescription)
                return
            }
            
            guard let data = data else {
                completion(false,list, "No Data")
                return
            }

            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(Json4Swift_Base.self, from: data)
                list = model.result?.savingsList ?? []
                completion(true,list, "success")
            } catch {
                completion(false,list, "Json decode failed")
            }
        }
        
        task.resume()
    }

    
    func fetchBannerList(from urlString: String, completion: @escaping (Bool,[BannerList]?,String) -> Void) {
        var bannerList : [BannerList] = []
        
        guard let url = URL(string: urlString) else {
//            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            completion(false,bannerList, "Invalid URL")

            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(false,bannerList, error.localizedDescription)
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                let statusError = NSError(domain: "HTTP Error", code: httpResponse.statusCode, userInfo: nil)
                completion(false,bannerList, statusError.localizedDescription)
                return
            }
            
            guard let data = data else {
                completion(false,bannerList, "No Data")
                return
            }

            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(Json4Swift_Base.self, from: data)
                bannerList = (model.result?.bannerList)!
                completion(true,bannerList, "success")
            } catch {
                completion(false,bannerList, "Json decode failed")
            }
        }
        
        task.resume()
    }
    
    func fetchFavoriteList(from urlString: String, completion: @escaping (Bool,[FavoriteList]?,String) -> Void) {
        var list : [FavoriteList] = []
        
        guard let url = URL(string: urlString) else {
//            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            completion(false,list, "Invalid URL")

            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(false,list, error.localizedDescription)
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                let statusError = NSError(domain: "HTTP Error", code: httpResponse.statusCode, userInfo: nil)
                completion(false,list, statusError.localizedDescription)
                return
            }
            
            guard let data = data else {
                completion(false,list, "No Data")
                return
            }

            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(Json4Swift_Base.self, from: data)
                list = model.result?.favoriteList ?? []
                completion(true,list, "success")
            } catch {
                completion(false,list, "Json decode failed")
            }
        }
        
        task.resume()
    }


}
