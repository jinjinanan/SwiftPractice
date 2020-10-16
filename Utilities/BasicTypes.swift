//
//  BasicTypes.swift
//  Practice
//
//  Created by admin on 2020/10/13.
//

import Foundation
import HandyJSON

protocol BasicProtocol {
    var errorCode : Int? {get set}
    var errorMsg : String? {get set}
    var result : Int? {get set}
}

struct Book : HandyJSON {
    var book_desc : String?
    var book_id : Int?
    var book_mark : Int?
    var book_name : String?
    var book_pic : String?
    var book_type : Int?
    var groom_id : Int?
    var is_free : Int?
    var score : String?
    var update_status : Int?
    var word_num : Int?
    var writer_name : String?
    
    
    
    
}

struct  BasicTypes: HandyJSON {

    
    var errorCode: Int?
    
    var errorMsg: String?
    
    var result: Int?
    
    var data: Array<Book>?
    

}
