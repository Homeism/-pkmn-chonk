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
    
    /**
     Derives a symmetric encryption key from the secret using HKDF key derivation.
     - Parameter hashFunction: The hash function to use for key derivation.
     - Parameter salt: The salt to use for key derivation.
     - Parameter sharedInfo: The shared information to use for key derivation.
     - Parameter outputByteCount: The length in bytes of resulting symmetric key.
     - Returns: The derived symmetric key.
     - Throws: `CryptoKitError.keyDerivationFailed`
     */
    public func hkdfDerivedSy