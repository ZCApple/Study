//
//  DataModel.swift
//  StudyProject
//
//  Created by 路过蜻蜓 on 2022/1/6.
//

import Foundation
import ObjectMapper

/*
 模型和json数据的互相转换
 */
class BaseModel: Mappable {
        
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
    }
}

class DataModel: BaseModel {
    var header: String?
    var cells: [String]?
    var footer: String?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        header    <- map["header"]
        cells     <- map["cells"]
        footer    <- map["footer"]
    }
}

