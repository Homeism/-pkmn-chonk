//
//  PrivateKey.swift
//  CCurve25519
//
//  Created by Christoph on 09.01.20.
//

import Foundation
import CEd25519

public extension Curve25519.Signing {
    
    /// A Curve25519 private key used to create cryptographic signatures.
    struct PrivateKey {
        
        private let bytes: [UInt8]
        
        /// The key (32 bytes)
        private let privateKeyBytes: [UInt8]
        
        /// The public key bytes
        private let publicKeyBytes: [UInt8]
        
        /**
         Creates a random Curve25519 private key for signing.
         - Throws: `CryptoKitError.noRandomnessSource`, `CryptoKitError.noRandomnessAvailable`
         */
        public init() throws {
            let seed = try Curve25519.newKey()
            self.init(bytes: seed)
        }
        
        /**
         Creates a Curve25519 private key for signing from a data representation.
         - Parameter rawRepresentation: A raw representation of the key as data.
         - Throw