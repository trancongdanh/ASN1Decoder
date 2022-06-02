//
//  X509CertificateObjc.m
//  X509CertificateObjc
//
//  Created by safetrust on 02/06/2022.
//

#import <Foundation/Foundation.h>
#import "X509CertificateObjc.h"
#import <ASN1Decoder/ASN1Decoder-Swift.h>

@interface X509CertificateObjc()

@property (nonatomic) X509Certificate* x509;

@end

@implementation X509CertificateObjc

-(void) initWithCert:(NSString*)cert {
    self.x509 = [[X509Certificate alloc] initWithCert:cert error:nil];
}

-(void) initWithCertPerm:(NSString*)certPem {
    self.x509 = [[X509Certificate alloc] initWithCertPEM:certPem error:nil];
}

-(NSString*) getSerialNumber {
    return self.x509.hexEncodedStringOfSerialNumber;
}

-(NSString*) getSubjectDistinguishedName {
    return self.x509.subjectDistinguishedName;
}

-(int) getVersion {
    return (int)[self.x509.version integerValue];
}

-(NSArray*) subjectWith:(int)oidRawValue {
    NSArray* ar = [self.x509 subjectWithOidRawValue:oidRawValue];
    return ar;
}

@end
