//
//  Nonce.swift
//  CCurve25519
//
//  Created by Christoph on 13.01.20.
//

import Foundation

public extension AES.GCM {
    
    /// A value used once during a cryptographic operation, and then discarded.
    struct Nonce {
        
        /// The length of a AES GCM length in bytes.
        public static let length = 12
        
        /// The raw bytes of the nonce
        var bytes: [UInt8