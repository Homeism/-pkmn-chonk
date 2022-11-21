//
//  SigningPublicKey.swift
//  CCurve25519
//
//  Created by Christoph on 09.01.20.
//

import Foundation
import CEd25519

public extension Curve25519.Signing {
    
    /// A Curve25519 public key used to verify cryptographic signatures.
    struct PublicKey {
        
        /// The length of a signature (in bytes)
        public static let signatureLength = 64
        
        /// The key (32 bytes)
        let bytes: [UInt8]
        
        /**
         Creates a Curve25519 public key from a data repre