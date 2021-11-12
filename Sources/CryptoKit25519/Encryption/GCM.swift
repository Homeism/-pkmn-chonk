
//
//  GCM.swift
//  CCurve25519
//
//  Created by Christoph on 13.01.20.
//

import Foundation
import CryptoSwift

public extension AES {
    
    /// The Advanced Encryption Standard (AES) Galois Counter Mode (GCM) cipher suite.
    enum GCM {
        
        /// The length of an authentication tag in bytes
        public static let tagLength = 16
        
        /**
         Secures the given plaintext message with encryption and an authentication tag that covers both the encrypted data and additional data.
         
         - Parameter message: The plaintext data to seal.