//
//  NetWork.swift
//  Practice
//
//  Created by admin on 2020/10/10.
//

import Foundation
import Moya
import RxSwift
import HandyJSON


public enum serviceMode {
    case test(path:String,param:[String:String])
    case a
    
}

public enum CountryKind {
    case England
    case Thiland
    case Vietnam
}

public enum EnviromentKind {
    case production
    case development
}

protocol ApiProtocol : TargetType {
    var countryKind : CountryKind {get}
    var enviromentKind : EnviromentKind {get}
  
}

extension ApiProtocol {
    var countryKind : CountryKind {
        return .England
    }
    var enviromentKind : EnviromentKind {
        return .development
    }
}

final class logPlugin:PluginType{

    func willSend(_ request: RequestType, target: TargetType)
    {
        DLog("😄请求地址 \(String(describing: request.request?.url ?? URL.init(string: "")))")
        DLog("😂请求参数 \(String(describing: String.init(data: request.request?.httpBody ?? Data(), encoding: String.Encoding.utf8)))")
    }

    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType)
    {
        
    }
}

let provider = MoyaProvider<serviceMode>(plugins:[logPlugin()])
let disposeBag = DisposeBag.init()


var headerpramagter = {
    return ["timestamp":fetchtimeInterval(),
            "appType":"iphone",
            "lang":fetchCurrentLanuage(),
            "osVersion":fetchOSVersion(),
            "osType":fetchOSType(),
            "osUuid":fetchUUID(),
            "phoneBrand":"Apple",
            "phoneType":fetchPhoneType(),
            "phoneOsVersion":fetchPhoneOsVersion(),
            "utc":fetchUTC()]
}()


extension serviceMode : ApiProtocol {
    
    public var path: String {
        switch self {
        case .test(let path,_):
            return path
        default:
            return ""
        }
    }
    
    public var method: Moya.Method {
        return .post
    }
    
    public var sampleData: Data {
        return Data.init()
    }

    public var task: Task {
        switch self {
        case .test(_, let param):
            return .requestParameters(parameters: param, encoding:URLEncoding.default)
        default:
            return .requestPlain
        }
    }

    public var headers: [String : String]? {
        return headerpramagter
    }
    
    public var baseURL: URL {
        switch enviromentKind {
        case .production:
            switch countryKind {
            case .England:
                return URL.init(string: "https://enapi.hinovelasia.com/")!
            case .Vietnam:
                return URL.init(string: "https://vnapi.hinovelasia.com/")!
            default:
                return URL.init(string: "https://thapi.hinovelasia.com/")!
            }
        default:
            switch countryKind {
            case .England:
                return URL.init(string: "http://www.hractuaL.com/api/")!
            case .Vietnam:
                return URL.init(string: "http://www.hractuaL.com/api/")!
            default:
                return URL.init(string: "http://www.hractuaL.com/api/")!
            }
        }
    }
    
}





func a () {
    
    provider.request(.test(path:Api_bookStore_free , param: [:])) { (result) in
        switch result {
           case let .success(moyaResponse):
            let str = try? moyaResponse.mapString()
            let statusCode = moyaResponse.statusCode
//            print( "😊\n \(statusCode ) \n \(str ?? String.init(statusCode))😊" )
            if let model = BasicTypes.deserialize(from: str)
            {
//                print(model.data ?? "a")
            }
           case let .failure(error):
            print(error)
            
           }
    }
    
    
}

func arx() {
    provider.rx.request(.test(path:Api_bookStore_free , param: ["a":"b","c":"d"])).asObservable().mapHandyJsonModel(BasicTypes.self).subscribe { (event) in
        switch event {
        case .next(_):
            DLog("OK")
        case .error(_):
            DLog("error")
        case .completed:
            DLog("complete")
        }
    }.disposed(by: disposeBag)






}
