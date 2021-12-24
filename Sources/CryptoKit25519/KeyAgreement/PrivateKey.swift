
//
//  File.swift
//  
//
//  Created by Christoph on 08.01.20.
//

import Foundation
import CEd25519
import CCurve25519

public extension Curve25519.KeyAgreement {
    
    /// A Curve25519 private key used to create cryptographic signatures.
    struct PrivateKey {
        
        private static let basepoint = [9] + Data(repeating: 0, count: 31)
        
        /// The key bytes
        private let bytes: [UInt8]
        
        /**
         Creates a random Curve25519 private key for key agreement.
         - Throws: `CryptoKitError.noRandomnessSource`, `CryptoKitError.noRandomnessAvailable`
         */
        public init() throws {
            self.bytes = try Curve25519.newKey().normalized
        }
        
        /**
         Creates a Curve25519 private key for key agreement from a collection of bytes.
         - Parameter rawRepresentation: A raw representation of the key as data.