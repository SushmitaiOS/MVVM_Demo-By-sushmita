//
//  NetworkManager.swift
//  OMDA(Driver app)
//
//  Created by MAC on 17/06/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

protocol APIModel : Codable {
    var success: Int? { get }
    var msg: String? { get }
    var http_status:  Int? { get }
}
enum NetworkResponse : String {
    case success
    case authenticationError = "You need to authenticate first."
    case badRequest          = "Bad Request"
    case outdated            = "The url you requested is outdated."
    case failed              = "Network request failed."
    case noData              = "Response returned with no data to decode."
    case unableToDecode      = "we couldn't decode the response"
}
enum APIResult<String>{
    case success
    case failure(String)
}
enum APIError :Error{
    case errorReport(desc:String)
}
struct NetworkManager {
    static let sharedInstance = NetworkManager()
    private init() {}
    static let environment :NetworkEnvironment = .development
    static let contentType = "application/x-www-form-urlencoded"
    static let imageBaseURL = BaseURLS.Image.rawValue
    let router = Router<APIEndPoint>()
    
    fileprivate func handleNetworkResponse(_ response : HTTPURLResponse, forData data : Data)->
        APIResult<String>{
            switch response.statusCode{
            case 200...299 : return.success
            case 404       : return.success
            case 401...500 : return.failure(NetworkResponse.authenticationError.rawValue)
            case 501...599 : return.failure(NetworkResponse.badRequest.rawValue)
            case 600       : return.failure(NetworkResponse.outdated.rawValue)
            default        : return.success
            }
    }
    func handleAPICalling<T:APIModel>(request:APIEndPoint,completion: @escaping ((Result<T,APIError>) -> Void)){
        router.request(request) { (data, response, error) in
            if error != nil {
                completion(.failure(.errorReport(desc: "Please check your network connection.")))
            } 
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response,forData:data ?? Data())
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(.failure(.errorReport(desc: NetworkResponse.noData.rawValue)))
                        return
                    }
                 print(String.init(data: responseData, encoding: .utf8))
                    do {
                        let result = try JSONDecoder().decode(T.self, from: responseData)
                       // print(result.http_status)
                        if result.success == 1 {
                            completion(.success(result))
                        }else if result.http_status == 401{
                            pleaseLoginFirst()
                        }
                        else {
                            completion(.failure(.errorReport(desc: result.msg ?? "")))
                        }
                    }
                    catch {
                        print(error.localizedDescription)
                        completion(.failure(.errorReport(desc: "Data Not Found")))
                    }
                case .failure(let networkFailureError):
                    
                    completion(.failure(.errorReport(desc: networkFailureError)))
                }
            }
        }
    }
     func pleaseLoginFirst() {
         print("login")
//        let storyboard = storeData.shared.storyboardMain
//         DispatchQueue.main.async {
//
////             let guestVC = storyboard.instantiateViewController(withIdentifier: "SelectYourInterfaceVC") as! SelectYourInterfaceVC
////             let navVC = UINavigationController(rootViewController: guestVC)
////             navVC.isNavigationBarHidden = true
////             AppSettingsData.token                = ""
////             AppSettingsData.hasLogin             = false
////             AppSettingsData.userID               =  ""
////             AppSettingsData.emailId              =  ""
////             AppSettingsData.token                =  ""
////             AppSettingsData.profileComplete      =  ""
////             AppSettingsData.currentUserType      =  ""
////             AppSettingsData.studentInternational =  ""
////             AppSettingsData.studentBand          =  ""
////             AppSettingsData.studentSport         =  ""
////             AppSettingsData.profilePic           =  ""
////             AppSettingsData.firstNme             =  ""
////             AppSettingsData.lastNme              =  ""
////             UIApplication.shared.windows.first?.rootViewController = navVC
////             UIApplication.shared.windows.first?.makeKeyAndVisible()
//         }
           
        }
    func handleMultipartProgress(completion: @escaping ((Double) -> Void)){
        router.observeProgress(completion: completion)
    }
}

