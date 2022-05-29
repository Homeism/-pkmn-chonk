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
         - Throws: `CryptoKitError.invalidKeyLength`, if the key length is not `Curve25519.keyLength`.
         */
        public init(rawRepresentation: Data) throws {
            guard rawRepresentation.count == Curve25519.keyLength else {
                throw CryptoKitError.invalidKeyLength
            }
            self.init(bytes: Array(rawRepresentation))
        }
        
        public init(bytes: [UInt8]) {
            var pub = [UInt8](repeating: 0, count: Curve25519.keyLength)
            var priv = [UInt8](repeating: 0, count: Curve25519.SHA512length)
            pub.withUnsafeMutableBufferPointer { pP in
                priv.withUnsafeMutableBufferPointer { sP in
                    bytes.withUnsafeBytes { s in
                        ed25519_create_keypair(
                            pP.baseAddress,
                            sP.baseAddress,
                            s.bindMemory(to: UInt8.self).baseAddress)
                    }
                }
            }

            self.bytes = bytes
            self.