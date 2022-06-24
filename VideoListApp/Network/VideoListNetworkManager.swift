//
//  VideoListNetworkManager.swift
//  VideoListApp
//
//  Created by Mert Köksal on 24.06.2022.
//

import UIKit

class VideoListNetworkManager {
    static let shared = VideoListNetworkManager()
    
    func providerVideo(completion: @escaping ([VideoModel]?) -> ()) {
        let videoUrl = "http://localhost:4000/videos"
        if let url = URL(string: videoUrl) {
            let session = URLSession(configuration: .default)
            var request = URLRequest(url:url)
            request.httpMethod = "GET"
            let task = session.dataTask(with: request as URLRequest) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let result = try? decoder.decode([VideoModel].self, from:safeData)
                            DispatchQueue.main.async {
                                completion(result)
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
                
            }
            task.resume()
        }
    }
}
