//
//  CarDrSdk.swift
//  AwesomeProject
//
//  Created by Arvind Mehta on 26/07/23.
//

import Foundation
import CarDrSDK

@objc(CarDrSdk)
public class CarDrSdk : RCTEventEmitter,CDCallback {
  public func getVin(vin: String) {
    let value = ["vin":vin
                 ] as [String : Any]
    sendEvent(withName: "pidVin", body: value)
  }
  
  public func getRealTimePidResponse(pidName: String, value: String) {
    let value = ["pidName":pidName,
                 "value":value
                 ] as [String : Any]
    sendEvent(withName: "pidResponse", body: value)
  }
  
  public func getLoginStatus(user: CarDrSDK.CDUser) {
    
    let value = ["status":user.status!,
                 "message":user.message,
                 "token":user.token] as [String : Any]
    sendEvent(withName: "loginstatus", body: value)
  }
  
  public func scanError(user: CarDrSDK.CDUser) {
    let value = ["status":user.status!,
                 "message":user.message] as [String : Any]
    sendEvent(withName: "scanError", body: value)
  }
  
  public func remaningTime(time: String, type: String) {
    let value = ["time":time,
                 "type":type] as [String : Any]
    sendEvent(withName: "remainingTime", body: value)
  }
  
  public func scanStart(user: CarDrSDK.CDUser) {
    let value = ["status":user.status!,
                 "message":user.message] as [String : Any]
    sendEvent(withName: "scanstart", body: value)
  }
  
  public func scanResponse(user: CarDrSDK.CDUser, cdscanResponse: CarDrSDK.CDDeviceResponse) {
    var dtc = [String]()
    var desc = [String]()
    var status = [String]()
    if(cdscanResponse.cdScanResponse != nil){
      for item in cdscanResponse.cdScanResponse!{
        dtc.append(item.dtcCode)
        desc.append(item.dtcDesc)
        status.append(item.dtcStatus)
      }
      
    }
    let value = ["vin":cdscanResponse.vin,
                 "dtc":dtc,
                 "desc":desc,
                 "status":status] as [String : Any]
    sendEvent(withName: "scanresponse", body: value)
    getPCF(vin: cdscanResponse.vin,dtc: "P001B,P0012,P0015",token: "A4VSNMhXJN",key: "9A8E222B15B3FAE9C365E48629613")
  }
  
  public func getPCFResponse(response: CarDrSDK.PCFResponse) {
    
    
  }
  
  //sendEvent(withName: "getCDDevice", body: ["token",user.token])
  
  
  
  var cardrApi:CarDrConnectionApi? = nil
  @objc
  override static public func requiresMainQueueSetup() ->Bool{
    return true;
  }
  
  @objc
  override public func constantsToExport() -> [AnyHashable: Any]!{
    return ["initialCount": 0];
  }
  
  override public func supportedEvents() -> [String]! {
    return ["scanresponse","loginstatus","scanstart","remainingTime","pidVin","pidResponse","scanError","pcfresponse"];
  }
  
  @objc
  func initialize(){
    cardrApi = CarDrConnectionApi()
    cardrApi?.cdCallBack = self
   
  }
  
  @objc
  func connectOBD(_ param1: String, param2: String) {
     
    if(cardrApi != nil){
      initialize()
     
      cardrApi?.connectOBD(userName: param1, password: param2)
    }
  }
  
  @objc
  func disconnectOBD() {
     
    if(cardrApi != nil){
      cardrApi?.disconnetOBD()
    }
  }
  

  
  @objc
  func getPCF(vin:String,dtc:String,token:String,key:String){
    if(cardrApi != nil){
      if(!dtc.isEmpty){
        let dtcArray = dtc.components(separatedBy: ",")
        cardrApi?.getPCF(vin: vin, dtc: dtcArray, token: token, key: key)
      }
      
    }
   
  }
  

  
}
