# [DEPRECATED] CryptoKit25519
A Swift module for Curve25519 functions and AES-GCM encryption compatible with Apple's CryptoKit.

⚠️⚠️⚠️ Now deprecated. Use [swift-crypto](https://github.com/apple/swift-crypto) instead. ⚠️⚠️⚠️

## Purpose

This module provides signatures and key agreement based on Curve25519 in Swift. This library is meant to be compatible and syntactically similar to Apple's [`CryptoKit`](https://developer.apple.com/documentation/cryptokit) framework, which is only available for their recent operating systems. This library provides similar capabilities as [`CryptoKit.Curve25519`](https://developer.apple.com/documentation/cryptokit/curve25519), and has a very similar structure.

## Installation

When using the Swift Package Manager, specify in `Package.swift`:

````swift
.package(url: "https://github.com/christophhagen/CryptoKit25519", from: "0.6.0")
````

Then, in your source files, simply:

````swift
import CryptoKit25519
````

## Usage

This library is built to be *very* similar to Apple's [`CryptoKit`](https://developer.apple.com/documentation/cryptokit) framework, so much of the documentation there also applies to this framework. Notable differences are:
- Operations are NOT constant-time. 
- Sensitive keys are NOT immediately zeroized after use.

Currently supported operations:
- Signatures with Curve25519 (No support for P521, P384, or P256)
- Key Agreement with Curve25519 (No support for P521, P384, or P256)
- Encryption with AES-GCM (No support for ChaChaPoly)

If you need additional operations, have a look at [OpenCrypto](https://github.com/vapor/open-crypto).

### Randomness

`CryptoKit25519` requires a source of cryptographically secure random numbers to generate keys. On supported platforms (iOS 2.0+, macOS 10.7+, tvOS 9.0+, watchOS 2.0+, macCatalyst 13.0+) [SecCopyRandomBytes](https://developer.apple.com/documentation/security/1399291-secrandomcopybytes) is used as the default. On other platforms, the random bytes are calculated based on [UInt8.random(in:using:)](https://developer.apple.com/documentation/swift/uint8/3020624-random).

You can provide a custom source for random numbers by setting `Randomness.source`:
````swift
Randomness.source = { count in
    return ... // Return a [UInt8] with `count` random bytes, or nil, if no randomness is available.
}
````

The custom source is then use for calls to the following functions:
````swift
Curve25519.Signing.PrivateKey()
Curve25519.KeyAgreement.PrivateKey()
SymmetricKey(size:)
AES.GCM.Nonce()
AES.GCM.seal(_:key:nonce:authenticating)
````

### Signing

Signing is part of public-key cryptography. Private keys can create signatures of data, while the corresponding public keys can verif