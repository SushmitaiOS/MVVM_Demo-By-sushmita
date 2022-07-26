//
//  ApiEndPoints.swift
//  HBCU App
//
//  Created by Paras on 07/02/22.
//

import UIKit

enum NetworkEnvironment : String {
    case development  = "https://ankit.parastechnologies.in/ebikes/"
}
enum BaseURLS : String{
    case Image        = "https://ankit.parastechnologies.in/ebikes/public/uploads/user_images/"
    case uploadImg   = "https://ankit.parastechnologies.in/ebikes/public/uploads/user_files/"
    case productUrl  = "https://ankit.parastechnologies.in/ebikes/writable/uploads/product_images/"
}
enum APIEndPoint{
    case signUp(param          : [String:Any])
    case uploadProfileImg(profileImg : UIImage?)
}

extension APIEndPoint:EndPointType{
    var environmentBaseURL : String {
        return NetworkManager.environment.rawValue
    }
    var baseURL: URL{
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    var path: String{
        switch  self {
        case .signUp:
            return "auth/register"
        case .uploadProfileImg:
            return "api/upload_profile_photo"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .post
        }
    }
    var task: HTTPTask{
        switch self {
      
        case .signUp(param: let param):
            return.requestParametersAndHeaders(bodyParameters: param, bodyEncoding: .formDataEncoding, urlParameters: nil, additionHeaders: ["Content-Type":NetworkManager.contentType])
        case.uploadProfileImg(profileImg: let profileImg):
            let boundary = "Boundary-\(UUID().uuidString)"
            var body = Data()
            
            if let pic = profileImg{
                let imageData = pic.jpegData(compressionQuality: 0.5) ?? Data()
                body.append("Content-Disposition: form-data; name=\"file_name\"; filename=\"\(Date().timeIntervalSince1970).jpg\"\r\n")
                body.append("Content-Type: image/jpg\r\n\r\n")
                body.append(imageData)
                body.append("\r\n")
            }
            body.append("--".appending(boundary.appending("--")))
            return .requestMultipart(data: body, additionHeaders: ["Content-Type":"multipart/form-data; boundary=\(boundary)","Authorization": "Bearer \(AppSettingsData.token)"])
        }
    }
    var headers: HTTPHeaders?{
        return nil
    }
}



extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
    mutating func append(_ intValue: Int) {
        var value = intValue
        let data = Data(bytes: &value,count: MemoryLayout.size(ofValue: value))
        append(data)
    }
    func sizeString(units: ByteCountFormatter.Units = [.useAll], countStyle: ByteCountFormatter.CountStyle = .file) -> String {
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = units
        bcf.countStyle = .file

        return bcf.string(fromByteCount: Int64(count))
     }
}
