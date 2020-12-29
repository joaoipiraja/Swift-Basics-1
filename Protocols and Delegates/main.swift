//
//  main.swift
//  Protocols and Delegates
//
//  Created by João Victor Ipirajá de Alencar on 29/12/20.
//

import Foundation

protocol AdvanceLifeSupport{
    func peformCPR()
}

class EmergencyCallHandler{
    var delegate:AdvanceLifeSupport?
    
    func assesSituation(){
        print("Can you tell what happened?")
    }
    
    func medicalEmergency(){
        delegate?.peformCPR()
    }
}

struct parametric:AdvanceLifeSupport{
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func peformCPR() {
        print("The parametric does chest compression, 30 per second")
    }
    
}

class Doctor: AdvanceLifeSupport{
    
    init(handler:EmergencyCallHandler){
        handler.delegate = self
    }
    
    func peformCPR() {
        print("The doctor chest compression, 30 per second")
    }
    
    func useSteethescope(){
        print("Listening for heart sounds")
    }

}


class Surgeon:Doctor{
    
    override func peformCPR() {
        super.peformCPR()
        print("Sings staying alive by the BeeGees")
    }
    
    func useEletricDrill(){
        print("Whirr...")
    }
}


let peter = EmergencyCallHandler()
let joao = parametric(handler: peter)
let angela = Surgeon(handler: peter) //Last to call to EmergencyCallHandler() 
peter.assesSituation()
peter.medicalEmergency()
