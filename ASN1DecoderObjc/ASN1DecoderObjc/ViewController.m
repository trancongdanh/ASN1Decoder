//
//  ViewController.m
//  ASN1DecoderObjc
//
//  Created by safetrust on 02/06/2022.
//

#import "ViewController.h"
#import <ASN1Decoder/ASN1Decoder-Swift.h>

@interface ViewController ()

@end

@implementation ViewController

NSString* const CERT = @"MIIDMzCCAhugAwIBAgIEWaLwBDANBgkqhkiG9w0BAQsFADBTMQswCQYDVQQGEwJVUzERMA8GA1UEBwwITmV3IFlvcmsxHDAaBgkqhkiG9w0BCQEWDWpvaG5AbWFpbC5jb20xEzARBgNVBAMMCkpvaG4gU21pdGgwHhcNMTcwODI3MTYxNTAwWhcNMTgwODI3MTYxNTAwWjBTMQswCQYDVQQGEwJVUzERMA8GA1UEBwwITmV3IFlvcmsxHDAaBgkqhkiG9w0BCQEWDWpvaG5AbWFpbC5jb20xEzARBgNVBAMMCkpvaG4gU21pdGgwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDHc/RdKvcz+Sakwykuq/+mJZCQELYYk3ceVrYOwefaFLent4JU+/ATm+CQFXqyiQM1BTtXUwA3gG0sCufMUG5wkHN086KwclYhzPRZNGtLW2QshvvaN2wE4HxbFJ/DUUHPGuIlzewfecg/ZG9CwGeb/HQ4Qx+BI/U7JXykyNHFwMQrS5hGmvLH7MxSYiqt8X2VZ7vabxdqnvpufK34SyVQXkfRtwLNj7GO807HNQ5EGFw1hxJN3tBXG4z+1eq4rgy1RJY7c6ntkzOczrqw7Ut4OUmCRjAEggqPrG6R94D2f8vgEXB42TPSEKWwHi6/RAEZ1WO5YsDmLHVNxp8FvThVAgMBAAGjDzANMAsGA1UdDwQEAwIGQDANBgkqhkiG9w0BAQsFAAOCAQEAhlIaMaE9YTJUuSCy0LAd+nHzuTdokgDCXdT75KtsiNtQHQIDtLhdJGYUzlWUwY8SQWytvJORKi3qrA45oLwSJjVY4hZuNcaWleDumnHc4rbK9o6GJhEk/T49Vrc9q4CNX0/siPBsHwXdrqrLOR00yfrMYCPAUCryPbdx/IPbo8Z3kvlQHn8cqOjgqdwuy7PTMIMz6sCsBcV0OeAp80GDRAHpjB3qYhzhebiRiM+Bbqva6f4bxNmDNQtL0jt0a8KeyQrFNdAhgjYkAKTucThCu1laJKGKABK90dMoLtbJFxfRhjzmjX9TJGYJgCnRNDDnXpVUOspv2YeHvC9gOdRhaA==";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    X509Certificate* x509 = [[X509Certificate alloc] initWithCert:CERT error:nil];
    NSLog(@"%@", x509.subjectDistinguishedName);
}


@end
