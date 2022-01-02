//
//  File.swift
//  
//
//  Created by Christoph on 08.01.20.
//

import Foundation

public extension Curve25519.KeyAgreement {
    
    /// A Curve25519 public key used to verify cryptographic signatures.
    struct PublicKey {
        
        /// The length of a signature (in bytes)
        public static let signatureLength =