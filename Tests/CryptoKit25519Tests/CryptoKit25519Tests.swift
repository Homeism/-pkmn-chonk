
import XCTest
@testable import CryptoKit25519
import CryptoKit
import CEd25519

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, macCatalyst 13.0, *)
final class CryptoKit25519Tests: XCTestCase {

    static var allTests = [
        ("testKeyAgreementPublicKey", testKeyAgreementPublicKey),
        ("testSigningPublicKey", testSigningPublicKey),
        ("testVerifySignature", testVerifySignature),
        ("testSignatureCompatibility", testSignatureCompatibility),
        ("testKeyAgreement", testKeyAgreement)
    ]
    
    func testKeyAgreementPublicKey() throws {
        // Noise protocol test vector
        let sk1 = Data(base64Encoded: "S51mhgw53jFJK9s7CQUnv2bvHqdfEFu2+HMo37uf4zc=")!
        let pk1 = Data(base64Encoded: "Ht4jMICpMF9liuztB+8EztNwtfG7oJmzq8Oex7T1qD8=")!
        // Check CryptoKit
        let key1 = try CryptoKit.Curve25519.KeyAgreement.PrivateKey(rawRepresentation: sk1)
        XCTAssertEqual(key1.publicKey.rawRepresentation, pk1)
        // Check CryptoKit25519
        let key2 = try CryptoKit25519.Curve25519.KeyAgreement.PrivateKey(rawRepresentation: sk1)
        XCTAssertEqual(key2.publicKey.rawRepresentation, pk1)
        
        // Curve25519 test vector
        let sk2 = Data(base64Encoded: "yAZDncnSxHb/7Y8lgMCIjVirQGv3rjaYh5AhuWu0v1k=")!
        let pk2 = Data(base64Encoded: "G7dZZvLpOjaR3/+UK7KkZqHAi414yj9Nbfi4v6Lk7ig=")!
        
        // Check CryptoKit
        let key3 = try CryptoKit.Curve25519.KeyAgreement.PrivateKey(rawRepresentation: sk2)
        XCTAssertEqual(key3.publicKey.rawRepresentation, pk2)
        
        // Check CryptoKit25519
        let key4 = try CryptoKit25519.Curve25519.KeyAgreement.PrivateKey(rawRepresentation: sk2)
        XCTAssertEqual(key4.publicKey.rawRepresentation, pk2)
    }
    
    func testSigningPublicKey() throws {
        // Test a few iterations
        //for _ in 0..<10 {
        let sk = Data(base64Encoded: "nWGxne/9WmC6hEr0kuwsxERJxWl7MmkZcDusAxyuf2A=")!
        let pk = Data(base64Encoded: "11qYAYKxCrfVS/7TyWQHOg7hcvPapiMlrwIaaPcHURo=")!
        
        // Generate private key through CryptoKit
        let key1 = try CryptoKit.Curve25519.Signing.PrivateKey(rawRepresentation: sk)
        XCTAssertEqual(key1.publicKey.rawRepresentation, pk)
        
        // Compare with CryptoKit25519
        let key2 = try CryptoKit25519.Curve25519.Signing.PrivateKey(rawRepresentation: sk)
        XCTAssertEqual(key2.publicKey.rawRepresentation, pk)
    }
    
    func testVerifySignature() throws {
        let sk = try CryptoKit25519.Curve25519.Signing.PrivateKey()
        let signature = sk.signature(for: Data())
        let pk = sk.publicKey
        XCTAssertTrue(pk.isValidSignature(signature, for: Data()))
    }
    
    func testSignatureCompatibility() throws {
        let sk = Data(base64Encoded: "nWGxne/9WmC6hEr0kuwsxERJxWl7MmkZcDusAxyuf2A=")!
        
        let key1 = try CryptoKit.Curve25519.Signing.PrivateKey(rawRepresentation: sk)
        let key2 = try CryptoKit25519.Curve25519.Signing.PrivateKey(rawRepresentation: sk)
        
        let signature1 = try key1.signature(for: Data())
        XCTAssertTrue(key1.publicKey.isValidSignature(signature1, for: Data()))
        XCTAssertTrue(key2.publicKey.isValidSignature(signature1, for: Data()))
        
        let signature2 = key2.signature(for: Data())
        XCTAssertTrue(key1.publicKey.isValidSignature(signature2, for: Data()))
        XCTAssertTrue(key2.publicKey.isValidSignature(signature2, for: Data()))
    }
    
    func testKeyAgreement() throws {
        let salt = "Salt".data(using: .utf8)!
        let sharedInfo = "Info".data(using: .utf8)!
        let keyA = CryptoKit.Curve25519.KeyAgreement.PrivateKey()
        let keyB = try CryptoKit25519.Curve25519.KeyAgreement.PrivateKey()