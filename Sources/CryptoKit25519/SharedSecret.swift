//
//  SharedSecret.swift
//  CCurve25519
//
//  Created by Christoph on 08.01.20.
//

import Foundation
import CryptoSwift

/**
 A key agreement result from which you can derive a symmetric cryptographic key.
 */
public struct SharedSecret {
    
    /// The raw bytes of the secret
    let bytes: [UInt8]
    
    init(bytes: [UInt8]) {
        self.bytes = bytes
    }