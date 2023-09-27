//
//  GetVehicleTypes.swift
//  Car-Book
//
//  Created by Devgan on 21/09/23.
//

import Foundation
import ObjectMapper


struct GetVehicleTypes : Mappable {
  var data : [GetVehicleTypesData]?
  var count : Int?
  var success : Bool?
  var message : String?

  init?(map: Map) {

  }

  mutating func mapping(map: Map) {

    data <- map["data"]
    count <- map["count"]
    success <- map["success"]
    message <- map["message"]
  }

}

struct GetVehicleTypesData : Mappable {
  var _id : String?
  var vehicleTypeName : String?
  var vehicleTypeImg : String?
  var active : Bool?
  var createdAt : String?
  var updatedAt : String?
  var __v : Int?

  init?(map: Map) {

  }

  mutating func mapping(map: Map) {

    _id <- map["_id"]
    vehicleTypeName <- map["vehicleTypeName"]
    vehicleTypeImg <- map["vehicleTypeImg"]
    active <- map["active"]
    createdAt <- map["createdAt"]
    updatedAt <- map["updatedAt"]
    __v <- map["__v"]
  }

}
