//
//  X509CertificateObjc.h
//  X509CertificateObjc
//
//  Created by safetrust on 02/06/2022.
//

#ifndef X509CertificateObjc_h
#define X509CertificateObjc_h

@interface X509CertificateObjc : NSObject

-(void) initWithCert:(NSString*)cert;
-(void) initWithCertPerm:(NSString*)certPem;
-(NSString*) getSerialNumber;
-(NSString*) getSubjectDistinguishedName;
-(int) getVersion;
-(NSArray*) subjectWith:(int)oidRawValue;

@end

#endif /* X509CertificateObjc_h */
