//
//  OID.swift
//  ASN1Decoder
//
//  Created by Filippo Maguolo on 01/12/2019.
//  Copyright © 2019 Filippo Maguolo. All rights reserved.
//

import Foundation

@objc
public enum OID: Int, CustomStringConvertible {
    case etsiQcsCompliance = 0
    case etsiQcsRetentionPeriod = 1
    case etsiQcsQcSSCD = 2
    case dsa = 3
    case ecPublicKey = 4
    case prime256v1 = 5
    case ecdsaWithSHA256 = 6
    case ecdsaWithSHA512 = 7
    case rsaEncryption = 8
    case sha256WithRSAEncryption = 9
    case md5WithRSAEncryption = 10
    case sha1WithRSAEncryption = 11
    
    // Digest algorithms
    case sha1 = 12
    case pkcsSha256 = 13
    case sha2Family = 14
    case sha3_244 = 15
    case sha3_256 = 16
    case sha3_384 = 17
    case md5 = 18
    
    case pkcs7data = 19
    case pkcs7signedData = 20
    case pkcs7envelopedData = 21
    case emailAddress = 22
    case signingCertificateV2 = 23
    case contentType = 24
    case messageDigest = 25
    case signingTime = 26
    case certificateExtension = 27
    case jurisdictionLocalityName = 28
    case jurisdictionStateOrProvinceName = 29
    case jurisdictionCountryName = 30
    case authorityInfoAccess = 31
    case qcStatements = 32
    case cps = 33
    case unotice = 34
    case serverAuth = 35
    case clientAuth = 36
    case ocsp = 37
    case caIssuers = 38
    case dateOfBirth = 39
    case sha256 = 40
    case veriSignEVpolicy = 41
    case extendedValidation = 42
    case organizationValidated = 43
    case subjectKeyIdentifier = 44
    case keyUsage = 45
    case subjectAltName = 46
    case issuerAltName = 47
    case basicConstraints = 48
    case cRLDistributionPoints = 49
    case certificatePolicies = 50
    case authorityKeyIdentifier = 51
    case extKeyUsage = 52
    case subjectDirectoryAttributes = 53
    
    // X.500 attributes
    case commonName = 54
    case surname = 55
    case serialNumber = 56
    case countryName = 57
    case localityName = 58
    case stateOrProvinceName = 59
    case streetAddress = 60
    case organizationName = 61
    case organizationalUnitName = 62
    case businessCategory = 63
    case postalCode = 64
    case givenName = 65
    case dnQualifier = 66
    
    case domainComponent = 67

    case userId = 68
    
    public init?(rawValue: String) {
        var result: OID = .etsiQcsCompliance
        
        switch rawValue {
            case "0.4.0.1862.1.1": result = .etsiQcsCompliance
            case "0.4.0.1862.1.3": result = .etsiQcsRetentionPeriod
            case "0.4.0.1862.1.4": result = .etsiQcsQcSSCD
            case "1.2.840.10040.4.1": result = .dsa
            case "1.2.840.10045.2.1": result = .ecPublicKey
            case "1.2.840.10045.3.1.7": result = .prime256v1
            case "1.2.840.10045.4.3.2": result = .ecdsaWithSHA256
            case "1.2.840.10045.4.3.4": result = .ecdsaWithSHA512
            case "1.2.840.113549.1.1.1": result = .rsaEncryption
            case "1.2.840.113549.1.1.11": result = .sha256WithRSAEncryption
            case "1.2.840.113549.1.1.4": result = .md5WithRSAEncryption
            case "1.2.840.113549.1.1.5": result = .sha1WithRSAEncryption
                // Digest algorithms
            case "1.3.14.3.2.26": result = .sha1
            case "1.3.6.1.4.1.22554.1.2.1": result = .pkcsSha256
            case "1.3.6.1.4.1.22554.1.2": result = .sha2Family
            case "2.16.840.1.101.3.4.2.7": result = .sha3_244
            case "2.16.840.1.101.3.4.2.8": result = .sha3_256
            case "2.16.840.1.101.3.4.2.9": result = .sha3_384
            case "0.2.262.1.10.1.3.2": result = .md5
                //
            case "1.2.840.113549.1.7.1": result = .pkcs7data
            case "1.2.840.113549.1.7.2": result = .pkcs7signedData
            case "1.2.840.113549.1.7.3": result = .pkcs7envelopedData
            case "1.2.840.113549.1.9.1": result = .emailAddress
            case "1.2.840.113549.1.9.16.2.47": result = .signingCertificateV2
            case "1.2.840.113549.1.9.3": result = .contentType
            case "1.2.840.113549.1.9.4": result = .messageDigest
            case "1.2.840.113549.1.9.5": result = .signingTime
            case "1.3.6.1.4.1.11129.2.4.2": result = .certificateExtension
            case "1.3.6.1.4.1.311.60.2.1.1": result = .jurisdictionLocalityName
            case "1.3.6.1.4.1.311.60.2.1.2": result = .jurisdictionStateOrProvinceName
            case "1.3.6.1.4.1.311.60.2.1.3": result = .jurisdictionCountryName
            case "1.3.6.1.5.5.7.1.1": result = .authorityInfoAccess
            case "1.3.6.1.5.5.7.1.3": result = .qcStatements
            case "1.3.6.1.5.5.7.2.1": result = .cps
            case "1.3.6.1.5.5.7.2.2": result = .unotice
            case "1.3.6.1.5.5.7.3.1": result = .serverAuth
            case "1.3.6.1.5.5.7.3.2": result = .clientAuth
            case "1.3.6.1.5.5.7.48.1": result = .ocsp
            case "1.3.6.1.5.5.7.48.2": result = .caIssuers
            case "1.3.6.1.5.5.7.9.1": result = .dateOfBirth
            case "2.16.840.1.101.3.4.2.1": result = .sha256
            case "2.16.840.1.113733.1.7.23.6": result = .veriSignEVpolicy
            case "2.23.140.1.1": result = .extendedValidation
            case "2.23.140.1.2.2": result = .organizationValidated
            case "2.5.29.14": result = .subjectKeyIdentifier
            case "2.5.29.15": result = .keyUsage
            case "2.5.29.17": result = .subjectAltName
            case "2.5.29.18": result = .issuerAltName
            case "2.5.29.19": result = .basicConstraints
            case "2.5.29.31": result = .cRLDistributionPoints
            case "2.5.29.32": result = .certificatePolicies
            case "2.5.29.35": result = .authorityKeyIdentifier
            case "2.5.29.37": result = .extKeyUsage
            case "2.5.29.9": result = .subjectDirectoryAttributes
                // X.500 attributes
            case "2.5.4.3": result = .commonName
            case "2.5.4.4": result = .surname
            case "2.5.4.5": result = .serialNumber
            case "2.5.4.6": result = .countryName
            case "2.5.4.7": result = .localityName
            case "2.5.4.8": result = .stateOrProvinceName
            case "2.5.4.9": result = .streetAddress
            case "2.5.4.10": result = .organizationName
            case "2.5.4.11": result = .organizationalUnitName
            case "2.5.4.15": result = .businessCategory
            case "2.5.4.17": result = .postalCode
            case "2.5.4.42": result = .givenName
            case "2.5.4.46": result = .dnQualifier
                //
            case "0.9.2342.19200300.100.1.25": result = .domainComponent
                //
            case "0.9.2342.19200300.100.1.1": result = .userId
            default:
                result = .etsiQcsCompliance
        }

        
        self.init(rawValue: result.rawValue)
    }
    
    static func description(of value: String) -> String? {
        guard let oid = OID(rawValue: value) else {
            return nil
        }
        return "\(oid)"
    }
    
    public var description: String {
        var result = ""
        
        switch self {
            case .etsiQcsCompliance: result = "etsiQcsCompliance"
            case .etsiQcsRetentionPeriod: result = "etsiQcsRetentionPeriod"
            case .etsiQcsQcSSCD: result = "etsiQcsQcSSCD"
            case .dsa: result = "dsa"
            case .ecPublicKey: result = "ecPublicKey"
            case .prime256v1: result = "prime256v1"
            case .ecdsaWithSHA256: result = "ecdsaWithSHA256"
            case .ecdsaWithSHA512: result = "ecdsaWithSHA512"
            case .rsaEncryption: result = "rsaEncryption"
            case .sha256WithRSAEncryption: result = "sha256WithRSAEncryption"
            case .md5WithRSAEncryption: result = "md5WithRSAEncryption"
            case .sha1WithRSAEncryption: result = "sha1WithRSAEncryption"
                // Digest algorithms
            case .sha1: result = "sha1"
            case .pkcsSha256: result = "pkcsSha256"
            case .sha2Family: result = "sha2Family"
            case .sha3_244: result = "sha3_244"
            case .sha3_256: result = "sha3_256"
            case .sha3_384: result = "sha3_384"
            case .md5: result = "md5"
                //
            case .pkcs7data: result = "pkcs7data"
            case .pkcs7signedData: result = "pkcs7signedData"
            case .pkcs7envelopedData: result = "pkcs7envelopedData"
            case .emailAddress: result = "emailAddress"
            case .signingCertificateV2: result = "signingCertificateV2"
            case .contentType: result = "contentType"
            case .messageDigest: result = "messageDigest"
            case .signingTime: result = "signingTime"
            case .certificateExtension: result = "certificateExtension"
            case .jurisdictionLocalityName: result = "jurisdictionLocalityName"
            case .jurisdictionStateOrProvinceName: result = "jurisdictionStateOrProvinceName"
            case .jurisdictionCountryName: result = "jurisdictionCountryName"
            case .authorityInfoAccess: result = "authorityInfoAccess"
            case .qcStatements: result = "qcStatements"
            case .cps: result = "cps"
            case .unotice: result = "unotice"
            case .serverAuth: result = "serverAuth"
            case .clientAuth: result = "clientAuth"
            case .ocsp: result = "ocsp"
            case .caIssuers: result = "caIssuers"
            case .dateOfBirth: result = "dateOfBirth"
            case .sha256: result = "sha256"
            case .veriSignEVpolicy: result = "veriSignEVpolicy"
            case .extendedValidation: result = "extendedValidation"
            case .organizationValidated: result = "organizationValidated"
            case .subjectKeyIdentifier: result = "subjectKeyIdentifier"
            case .keyUsage: result = "keyUsage"
            case .subjectAltName: result = "subjectAltName"
            case .issuerAltName: result = "issuerAltName"
            case .basicConstraints: result = "basicConstraints"
            case .cRLDistributionPoints: result = "cRLDistributionPoints"
            case .certificatePolicies: result = "certificatePolicies"
            case .authorityKeyIdentifier: result = "authorityKeyIdentifier"
            case .extKeyUsage: result = "extKeyUsage"
            case .subjectDirectoryAttributes: result = "subjectDirectoryAttributes"
                // X.500 attributes
            case .commonName: result = "commonName"
            case .surname: result = "surname"
            case .serialNumber: result = "serialNumber"
            case .countryName: result = "countryName"
            case .localityName: result = "localityName"
            case .stateOrProvinceName: result = "stateOrProvinceName"
            case .streetAddress: result = "streetAddress"
            case .organizationName: result = "organizationName"
            case .organizationalUnitName: result = "organizationalUnitName"
            case .businessCategory: result = "businessCategory"
            case .postalCode: result = "postalCode"
            case .givenName: result = "givenName"
            case .dnQualifier: result = "dnQualifier"
                //
            case .domainComponent: result = "domainComponent"
                //
            case .userId: result = "userId"
        }
        
        return "\(result)"
    }
    
    public var rawValueString: String {
        var result = ""
        
        switch self {
            case .etsiQcsCompliance: result = "0.4.0.1862.1.1"
            case .etsiQcsRetentionPeriod: result = "0.4.0.1862.1.3"
            case .etsiQcsQcSSCD: result = "0.4.0.1862.1.4"
            case .dsa: result = "1.2.840.10040.4.1"
            case .ecPublicKey: result = "1.2.840.10045.2.1"
            case .prime256v1: result = "1.2.840.10045.3.1.7"
            case .ecdsaWithSHA256: result = "1.2.840.10045.4.3.2"
            case .ecdsaWithSHA512: result = "1.2.840.10045.4.3.4"
            case .rsaEncryption: result = "1.2.840.113549.1.1.1"
            case .sha256WithRSAEncryption: result = "1.2.840.113549.1.1.11"
            case .md5WithRSAEncryption: result = "1.2.840.113549.1.1.4"
            case .sha1WithRSAEncryption: result = "1.2.840.113549.1.1.5"
                // Digest algorithms
            case .sha1: result = "1.3.14.3.2.26"
            case .pkcsSha256: result = "1.3.6.1.4.1.22554.1.2.1"
            case .sha2Family: result = "1.3.6.1.4.1.22554.1.2"
            case .sha3_244: result = "2.16.840.1.101.3.4.2.7"
            case .sha3_256: result = "2.16.840.1.101.3.4.2.8"
            case .sha3_384: result = "2.16.840.1.101.3.4.2.9"
            case .md5: result = "0.2.262.1.10.1.3.2"
                //
            case .pkcs7data: result = "1.2.840.113549.1.7.1"
            case .pkcs7signedData: result = "1.2.840.113549.1.7.2"
            case .pkcs7envelopedData: result = "1.2.840.113549.1.7.3"
            case .emailAddress: result = "1.2.840.113549.1.9.1"
            case .signingCertificateV2: result = "1.2.840.113549.1.9.16.2.47"
            case .contentType: result = "1.2.840.113549.1.9.3"
            case .messageDigest: result = "1.2.840.113549.1.9.4"
            case .signingTime: result = "1.2.840.113549.1.9.5"
            case .certificateExtension: result = "1.3.6.1.4.1.11129.2.4.2"
            case .jurisdictionLocalityName: result = "1.3.6.1.4.1.311.60.2.1.1"
            case .jurisdictionStateOrProvinceName: result = "1.3.6.1.4.1.311.60.2.1.2"
            case .jurisdictionCountryName: result = "1.3.6.1.4.1.311.60.2.1.3"
            case .authorityInfoAccess: result = "1.3.6.1.5.5.7.1.1"
            case .qcStatements: result = "1.3.6.1.5.5.7.1.3"
            case .cps: result = "1.3.6.1.5.5.7.2.1"
            case .unotice: result = "1.3.6.1.5.5.7.2.2"
            case .serverAuth: result = "1.3.6.1.5.5.7.3.1"
            case .clientAuth: result = "1.3.6.1.5.5.7.3.2"
            case .ocsp: result = "1.3.6.1.5.5.7.48.1"
            case .caIssuers: result = "1.3.6.1.5.5.7.48.2"
            case .dateOfBirth: result = "1.3.6.1.5.5.7.9.1"
            case .sha256: result = "2.16.840.1.101.3.4.2.1"
            case .veriSignEVpolicy: result = "2.16.840.1.113733.1.7.23.6"
            case .extendedValidation: result = "2.23.140.1.1"
            case .organizationValidated: result = "2.23.140.1.2.2"
            case .subjectKeyIdentifier: result = "2.5.29.14"
            case .keyUsage: result = "2.5.29.15"
            case .subjectAltName: result = "2.5.29.17"
            case .issuerAltName: result = "2.5.29.18"
            case .basicConstraints: result = "2.5.29.19"
            case .cRLDistributionPoints: result = "2.5.29.31"
            case .certificatePolicies: result = "2.5.29.32"
            case .authorityKeyIdentifier: result = "2.5.29.35"
            case .extKeyUsage: result = "2.5.29.37"
            case .subjectDirectoryAttributes: result = "2.5.29.9"
                // X.500 attributes
            case .commonName: result = "2.5.4.3"
            case .surname: result = "2.5.4.4"
            case .serialNumber: result = "2.5.4.5"
            case .countryName: result = "2.5.4.6"
            case .localityName: result = "2.5.4.7"
            case .stateOrProvinceName: result = "2.5.4.8"
            case .streetAddress: result = "2.5.4.9"
            case .organizationName: result = "2.5.4.10"
            case .organizationalUnitName: result = "2.5.4.11"
            case .businessCategory: result = "2.5.4.15"
            case .postalCode: result = "2.5.4.17"
            case .givenName: result = "2.5.4.42"
            case .dnQualifier: result = "2.5.4.46"
                //
            case .domainComponent: result = "0.9.2342.19200300.100.1.25"
                //
            case .userId: result = "0.9.2342.19200300.100.1.1"
        }
        
        return "\(result)"
    }
}
