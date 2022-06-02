//
//  ASN1DecoderObjcTests.m
//  ASN1DecoderObjcTests
//
//  Created by safetrust on 02/06/2022.
//

#import <XCTest/XCTest.h>
#import "X509CertificateObjc.h"

#define CERT @"MIIDMzCCAhugAwIBAgIEWaLwBDANBgkqhkiG9w0BAQsFADBTMQswCQYDVQQGEwJVUzERMA8GA1UEBwwITmV3IFlvcmsxHDAaBgkqhkiG9w0BCQEWDWpvaG5AbWFpbC5jb20xEzARBgNVBAMMCkpvaG4gU21pdGgwHhcNMTcwODI3MTYxNTAwWhcNMTgwODI3MTYxNTAwWjBTMQswCQYDVQQGEwJVUzERMA8GA1UEBwwITmV3IFlvcmsxHDAaBgkqhkiG9w0BCQEWDWpvaG5AbWFpbC5jb20xEzARBgNVBAMMCkpvaG4gU21pdGgwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDHc/RdKvcz+Sakwykuq/+mJZCQELYYk3ceVrYOwefaFLent4JU+/ATm+CQFXqyiQM1BTtXUwA3gG0sCufMUG5wkHN086KwclYhzPRZNGtLW2QshvvaN2wE4HxbFJ/DUUHPGuIlzewfecg/ZG9CwGeb/HQ4Qx+BI/U7JXykyNHFwMQrS5hGmvLH7MxSYiqt8X2VZ7vabxdqnvpufK34SyVQXkfRtwLNj7GO807HNQ5EGFw1hxJN3tBXG4z+1eq4rgy1RJY7c6ntkzOczrqw7Ut4OUmCRjAEggqPrG6R94D2f8vgEXB42TPSEKWwHi6/RAEZ1WO5YsDmLHVNxp8FvThVAgMBAAGjDzANMAsGA1UdDwQEAwIGQDANBgkqhkiG9w0BAQsFAAOCAQEAhlIaMaE9YTJUuSCy0LAd+nHzuTdokgDCXdT75KtsiNtQHQIDtLhdJGYUzlWUwY8SQWytvJORKi3qrA45oLwSJjVY4hZuNcaWleDumnHc4rbK9o6GJhEk/T49Vrc9q4CNX0/siPBsHwXdrqrLOR00yfrMYCPAUCryPbdx/IPbo8Z3kvlQHn8cqOjgqdwuy7PTMIMz6sCsBcV0OeAp80GDRAHpjB3qYhzhebiRiM+Bbqva6f4bxNmDNQtL0jt0a8KeyQrFNdAhgjYkAKTucThCu1laJKGKABK90dMoLtbJFxfRhjzmjX9TJGYJgCnRNDDnXpVUOspv2YeHvC9gOdRhaA=="

#define CERT_PEM @"""-----BEGIN CERTIFICATE-----\nMIIItzCCB5+gAwIBAgIQCDa6olVoZBcgeFhGONhcNDANBgkqhkiG9w0BAQsFADB1MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMTQwMgYDVQQDEytEaWdpQ2VydCBTSEEyIEV4dGVuZGVkIFZhbGlkYXRpb24gU2VydmVyIENBMB4XDTE4MDYyNjAwMDAwMFoXDTIwMDYzMDEyMDAwMFowgc8xHTAbBgNVBA8MFFByaXZhdGUgT3JnYW5pemF0aW9uMRMwEQYLKwYBBAGCNzwCAQMTAlVTMRUwEwYLKwYBBAGCNzwCAQITBFV0YWgxFTATBgNVBAUTDDUyOTk1MzctMDE0MjELMAkGA1UEBhMCVVMxDTALBgNVBAgTBFV0YWgxDTALBgNVBAcTBExlaGkxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMQwwCgYDVQQLEwNTUkUxGTAXBgNVBAMTEHd3dy5kaWdpY2VydC5jb20wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDOn4XKOTAwt/aYabScEF1QOyVj0OVo1NmlyizWNZWyPg0pi53ggUoE98CeNUkz+6scEYqWNY6l3qKB56pJJIqNQmo9NoWO8k2G/jTIjFFGqNWYIq23i4+HqaXi1/H/aWFgazk1qkyyAOQQA/p56bG9m5Ok/IBM/BZnLqVJLGJOx9ihgG1dI9Dr6vap+8QaPRau3t9sEd2cxe4Ix7gLdaYG3vxsYf3BycKTSKtyrbkX1Qy0dsSxy+GCM2ETxE1gMa7vRomQ/ZoZo8Ib55kFp6lIT6UOOkkdyiJdpWPXIZZlsZR5wkegWDsJP7Xv7nE0WMkY1+05iNYtrzZRhhlnBw2AoMGNI+tsBXLQKeZfWFmU30bhkzX99pmvIYJ3f1fQGLao44nQEjdknIvpm0HMgvagYCnQVnnhJStzyYz324flWLPSp57OQeNMtr6O5W0HdWyhUZU+D4R6wObYQMZ5biYjRhtAQjMg8EVQEfZzEdr0WGO5JRHLHyot8tErXM9DiF5cCbzfcjeuoik2SHW+vbuPagMiHTM9+3lr0oRO+ZWwcM7fJvn1JfR2PDLAaI3QUv7OLhSH32UfQsk+1ICq05m2HwSxiAviDRl5De66MEZDdvu03sUAQTHvWnw0Mr7Jgbjtn0DeUKLYwsRWg+spqoFTJHWGbb9RIb+3lxev7nIqOQIDAQABo4ID5jCCA+IwHwYDVR0jBBgwFoAUPdNQpdagre7zSmAKZdMh1Pj41g8wHQYDVR0OBBYEFGywQ1b+PegS7NkS9WPVxMoHr7B2MIGRBgNVHREEgYkwgYaCEHd3dy5kaWdpY2VydC5jb22CDGRpZ2ljZXJ0LmNvbYIUY29udGVudC5kaWdpY2VydC5jb22CF3d3dy5vcmlnaW4uZGlnaWNlcnQuY29tghJsb2dpbi5kaWdpY2VydC5jb22CEGFwaS5kaWdpY2VydC5jb22CD3dzLmRpZ2ljZXJ0LmNvbTAOBgNVHQ8BAf8EBAMCBaAwHQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMCMHUGA1UdHwRuMGwwNKAyoDCGLmh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9zaGEyLWV2LXNlcnZlci1nMi5jcmwwNKAyoDCGLmh0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNvbS9zaGEyLWV2LXNlcnZlci1nMi5jcmwwSwYDVR0gBEQwQjA3BglghkgBhv1sAgEwKjAoBggrBgEFBQcCARYcaHR0cHM6Ly93d3cuZGlnaWNlcnQuY29tL0NQUzAHBgVngQwBATCBiAYIKwYBBQUHAQEEfDB6MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wUgYIKwYBBQUHMAKGRmh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFNIQTJFeHRlbmRlZFZhbGlkYXRpb25TZXJ2ZXJDQS5jcnQwDAYDVR0TAQH/BAIwADCCAX4GCisGAQQB1nkCBAIEggFuBIIBagFoAHYAu9nfvB+KcbWTlCOXqpJ7RzhXlQqrUugakJZkNo4e0YUAAAFkPjJMpQAABAMARzBFAiEAtvfxjDWBvpmqcq7+1X8lOyqKUJ8y5r31V4kV4tzQSPcCIG8AAjqwQwLG6ObfgMe0B06AwM7K1JEAsyv8QP5r/EPUAHYAVhQGmi/XwuzT9eG9RLI+x0Z2ubyZEVzA75SYVdaJ0N0AAAFkPjJMFgAABAMARzBFAiEAkDHYU+MhibIUpVtiPAFyEzv35P3Vwn5ODseJmDI6dZkCICb4xzUGBy7aEQKJLOuM1F0AvMjEEB1OQQc9IWEY7UdPAHYAh3W/51l8+IxDmV+9827/Vo1HVjb/SrVgwbTq/16ggw8AAAFkPjJNlAAABAMARzBFAiBSMM3aExfTbMG1btIu+LCW9ALj4FT6scxUUgy5+OSH/gIhAPtqsgHiH6m6Qml1E9smajxYa773+YZdxMKbtEEe2ZV8MA0GCSqGSIb3DQEBCwUAA4IBAQCPcXLe1MjGJtwfihuI1S53GdokFAcl94ouoWxWd7ASfsufUyxsFroxDhNwxd8mQOH7V3ehZTiot6P+xMZOrYxgJx5CXbcLt07RZHT0w/Pf052gq7bPGbHsrjtlXq1MDn8c8D+Fnv2qSgE4f/9wQ1gMU4IKojaO4YH9FYoacA8puXUlK1pBCuCK0jJykyAtD9z4oTD/ZLBQOmTJ4VwJ5rHNCfdI8akR9OYYyx9GCbeWYv5JCcIyzPyvZe6ceICEnRGliU/EzryyWhq4Vx/zReBgoX6xOWfW1ZAota0etzo9pSWjOdrrj1I7q0bAhL1eUuXE8FSm6M8ZogW/ZYkOHE2u\n-----END CERTIFICATE-----"""

@interface ASN1DecoderObjcTests : XCTestCase

@end

@implementation ASN1DecoderObjcTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testDecodingPEM {
    X509CertificateObjc* x509 = [[X509CertificateObjc alloc] init];
    [x509 initWithCertPerm:CERT_PEM];
    
    int version = [x509 getVersion];
    NSString* serialNumber = [x509 getSerialNumber];
    NSString* subject = [x509 getSubjectDistinguishedName];
    NSArray* subjectCommonName = [x509 subjectWith:54]; // .commonName
    NSArray* subjectSerialNumber = [x509 subjectWith:56]; // .serialNumber
    NSArray* subjectOrganizationName = [x509 subjectWith:61]; // .organizationName
    
    XCTAssertEqual(version, 3);
    XCTAssertEqualObjects(serialNumber, @"0836BAA2556864172078584638D85C34");
    XCTAssertEqualObjects(subject, @"businessCategory=Private Organization, jurisdictionC=US, jurisdictionST=Utah, SERIALNUMBER=5299537-0142, C=US, ST=Utah, L=Lehi, O=\"DigiCert, Inc.\", OU=SRE, CN=www.digicert.com");
    XCTAssertEqualObjects(subjectCommonName.firstObject, @"www.digicert.com");
    XCTAssertEqualObjects(subjectSerialNumber, @[@"5299537-0142"]);
    XCTAssertEqualObjects(subjectOrganizationName, @[@"DigiCert, Inc."]);
}

- (void)testDecoding {
    X509CertificateObjc* x509 = [[X509CertificateObjc alloc] init];
    [x509 initWithCert:CERT];
    
    NSString* serialNumber = [x509 getSerialNumber];
    NSString* subject = [x509 getSubjectDistinguishedName];
    
    XCTAssertEqualObjects(serialNumber, @"59A2F004");
    XCTAssertEqualObjects(subject, @"C=US, L=New York, E=john@mail.com, CN=John Smith");
}

@end
