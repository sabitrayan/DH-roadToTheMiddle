//
//  NetworkServiesMovies.swift
//  Diplom
//
//  Created by ryan on 22.11.2021.
//

import Foundation

// MARK: Network Services  to Obtain Data to NSOBJECT to Decode json in Dictionary

class NetworkServiesMovies {
    // MARK: Singleton to share servcies to controller
    static var shared = NetworkServiesMovies()

    // MARK: Managed session to url
    let session = URLSession(configuration: .default)


    // MARK:- Services to decode popular Data to api rest
    func sycnPopular(searchTerm: String,completion: @escaping (()-> Void)) {
        let token = "5fff233cf139639b37ee955e7a852f34"
        let URL_BASE = "https://api.themoviedb.org/3/movie/\(searchTerm)?api_key=\(token)&language=en-US"
        guard let url = URL(string: URL_BASE) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { data, response, error in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
//                print(json)
                let model = try JSONDecoder().decode(APIResponse<[PopularServiceModel]>.self, from: data!)

//                Save Data Database Local
                model.results.forEach { $0.store()}
                completion()
            } catch {
                print(error)
                completion()
            }
        }
        task.resume()
    }
// MARK:- Services to decode TopRated Data to api rest
    func sycnTopRated(searchTerm: String,completion: @escaping (()-> Void)) {
        let token = "5fff233cf139639b37ee955e7a852f34"
        let URL_BASE = "https://api.themoviedb.org/3/movie/\(searchTerm)?api_key=\(token)&language=en-US"
        guard let url = URL(string: URL_BASE) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { data, response, error in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
//                print(json)
                let model = try JSONDecoder().decode(APIResponse<[TopRatedServiceModel]>.self, from: data!)

//                Save Data Database Local
                model.results.forEach { $0.store()}
                completion()
            } catch {
                print(error)
                completion()
            }
        }
        task.resume()
    }

    // MARK:- Services to decode Upcommig Data to api rest
    func sycnUpcoming(searchTerm: String,completion: @escaping (()-> Void)) {
        let token = "5fff233cf139639b37ee955e7a852f34"
        let URL_BASE = "https://api.themoviedb.org/3/movie/\(searchTerm)?api_key=\(token)&language=en-US"
        guard let url = URL(string: URL_BASE) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { data, response, error in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
//                print(json)
                let model = try JSONDecoder().decode(APIResponse<[UpcomingServiceModel]>.self, from: data!)

//                Save Data Database Local
                model.results.forEach { $0.store()}
                completion()
            } catch {
                print(error)
                completion()
            }
        }
        task.resume()
    }

    // MARK:- Services to decode Search Data to api rest to aplicated Search Online to Movie
    func fecthSearch(searchTerm: String, completion: @escaping ([Results], Error?) -> ()) {
        let token = "5fff233cf139639b37ee955e7a852f34"
//        https://api.themoviedb.org/3/search/movie?api_key=5fff233cf139639b37ee955e7a852f34&query=avengers
        let URL_BASE = "https://api.themoviedb.org/3/search/movie?api_key=\(token)&query=\(searchTerm)"
        guard let url = URL(string: URL_BASE) else {return}

        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                print("Failed to fetch apps:", err)
                completion([], nil)
                return
            }
//                        print(data)
//                        print(String(data: data!, encoding: .utf8))
            guard let data = data else {return}

            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
//                print(searchResult)
                completion(searchResult.results, nil)
            } catch let jsonErr {
                debugPrint("Failed to decode json:", jsonErr)
                completion([], jsonErr)
            }

        }.resume()
    }

    // MARK:- Services to decode Video to api rest to aplicated Search Online to Movie
        func fetchVideos(id: Int32, completion: @escaping ([ResultVideo], Error?) -> ()) {
        let token = "5fff233cf139639b37ee955e7a852f34"
    //        https://api.themoviedb.org/3/movie/632632/videos?api_key=5fff233cf139639b37ee955e7a852f34&language=en-US
        let URL_BASE = "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=\(token)&language=en-US"
        guard let url = URL(string: URL_BASE) else {return}

        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                print("Failed to fetch apps:", err)
                completion([], nil)
                return
            }
    //                        print(data)
    //                        print(String(data: data!, encoding: .utf8))
            guard let data = data else {return}

            do {
                let searchResult = try JSONDecoder().decode(ResultsVideo.self, from: data)
    //                print(searchResult)
                completion(searchResult.results, nil)
            } catch let jsonErr {
                debugPrint("Failed to decode json:", jsonErr)
                completion([], jsonErr)
            }

        }.resume()
    }

}






// MARK:- Struct to decode ApiResponser with Generics Data to api rest

public struct APIResponse<T: Codable> : Codable {
   public let total_results: Int
   public let page: Int
   public let results: T

}
