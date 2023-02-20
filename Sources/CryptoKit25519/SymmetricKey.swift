//
//  SymmetricKey.swift
//  CCurve25519
//
//  Created by Christoph on 08.01.20.
//

import Foundation

/** A symmetric cryptographic key.
 
 You typically derive a symmetric key from an instance of a shared secret (`SharedSecret`) that you obtain through key agreement. You use a symmetric key to compute a message authentication code like `HMAC`, or to open and close a sealed box (`ChaChaPoly.SealedBox` or `AES.GCM.SealedBox`) using a cipher like `ChaChaPoly` or `AES`.
 */
public struct SymmetricKey {
    
    let bytes: [UInt8]
    
    // MARK: Creating a Key
    
    /**
     Creates a key from the given data.
     
     - Parameter data: The contiguous bytes from which to create the key.
     */
    public init(data: Data) 