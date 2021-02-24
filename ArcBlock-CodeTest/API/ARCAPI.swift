//
//  ARCAPI.swift
//  ArcBlock-CodeTest
//
//  Created by 高宇 on 2021/2/24.
//

import Foundation
import Moya

enum ARCAPI {
    case fetchHomeList
}

extension ARCAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://example.com")!
    }
    
    var path: String {
        switch self {
        case .fetchHomeList:
            return "fetchHomeList"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchHomeList:
            return Method.get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .fetchHomeList:
            return """
                {"code":0,"msg":"ok","data":[{"id":1,"type":"text","content:":"首先，感谢您抽出宝贵的时间进行 Coding Test, 这个 Coding Test 的目标是实现一个多类型的列表页以及对应的详情页面，您可以自由发挥实现整体效果，我们将根据您的最终作品做一个评估考核。"},{"id":2,"type":"img","imgUrls":["https://www.arcblockio.cn/blog/static/2c6120caf67e5c927e7254f115e58fcd/38a09/cover.jpg"]},{"id":3,"type":"text-img","content:":"下面是 ArcBlock DevCon 2020 的精彩图片...(可能是很长的文字，多张不同图片，图片可以是0张或者很多张，这里只给了三张为例子)","imgUrls":["https://www.arcblockio.cn/blog/static/88b798d281e42ae3570a25e208e89d39/38a09/cover.jpg","https://www.arcblockio.cn/blog/static/461a789adcb0f768d46d60163ee73bd3/f5292/devcon.jpg","https://www.arcblock.io/blog/static/fb2e8a2c56da3fadc4ff21ed5d96a4bc/38a09/cover.jpg"]},{"id":4,"type":"text-img","content:":"这是 ArcBlock ABT Node 界面截图","imgUrls":["https://www.arcblockio.cn/blog/static/e8e5ec2f2824b819380b605d6c50cc2b/92c65/blocklets.png"]},{"id":5,"type":"text-link","content:":"这是 ABT 钱包的官网页面, 欢迎体验（需要考虑链接可访问）","link":"https://abtwallet.io/zh/"}]}
            """.utf8Encoded
        }
    }
    
    var task: Task {
        switch self {
        case .fetchHomeList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}

private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}


public enum NetworkActivityChangeType {
    case began, ended
}

public final class NetworkActivityPlugin: PluginType {

    public typealias NetworkActivityClosure = (_ change: NetworkActivityChangeType, _ target: TargetType) -> Void
    let networkActivityClosure: NetworkActivityClosure

    public init(networkActivityClosure: @escaping NetworkActivityClosure) {
        self.networkActivityClosure = networkActivityClosure
    }

    public func willSend(_ request: RequestType, target: TargetType) {
        networkActivityClosure(.began, target)
    }

    public func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        networkActivityClosure(.ended, target)
    }
}


extension ARCAPI {
    public static let provider = MoyaProvider<ARCAPI>(stubClosure: MoyaProvider<ARCAPI>.immediatelyStub, plugins: [NetworkActivityPlugin(networkActivityClosure: { (type, targt) in
  
    })])
}

