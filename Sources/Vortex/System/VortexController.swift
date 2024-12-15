//
//  File.swift
//  Vortex
//
//  Created by Andrew on 09/12/2024.
//

import SwiftUI


class VortexController {
    
    var activeSystems: Set<VortexSystem> = []
    var primarySystem: VortexSystem!
    
    func remove(_ system: VortexSystem) { 
        let systemId = system.id
        activeSystems.remove(system)
            
        if primarySystem.id == systemId, !activeSystems.isEmpty { 
            primarySystem = activeSystems.first!
        }
    }
    
    /// Adds a system to the activeSystems under management
    func add(_ system: VortexSystem) {
        activeSystems.insert(system)
        // set the primary system if it's currently not set
        if activeSystems.isEmpty { primarySystem = system }
    }
    
    var primaryExists: Bool {
        activeSystems.contains(primarySystem)
    }
}
