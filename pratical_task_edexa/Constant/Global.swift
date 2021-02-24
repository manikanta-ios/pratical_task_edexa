//
//  Global.swift
//  AliveCor_Task
//
//  Created by Admin on 11/12/20.
//

import Foundation

struct Domain {
	static let dev = "https://api.npoint.io/"
}
extension Domain {
	static func baseUrl() -> String {
		return Domain.dev
	}
}

struct APIEndpoint {
	static let cities         = "81ada0361bbd877efb9e"
}


enum HTTPHeaderField: String {
	case authentication  = "Authorization"
	case contentType     = "Content-Type"
	case acceptType      = "Accept"
	case acceptEncoding  = "Accept-Encoding"
	case acceptLangauge  = "Accept-Language"
}

enum ContentType: String {
	case json            = "application/json"
	case multipart       = "multipart/form-data"
	case ENUS            = "en-us"
}

