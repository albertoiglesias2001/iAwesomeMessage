
/*
 *********************************************************************************
 Created by Alberto Iglesias (alberto@visualnet.inf.br)
 Copyright (c) 1999-2017 by Visual Net. All rights reserved.
 www.vnsoft.es
 www.visualnet.inf.br
 *********************************************************************************
 */

#import "iAwesomeMessage.h"
#import "iCore.h"
#import "RNBlurModalView.h"
#import <QuartzCore/QuartzCore.h>

@interface B4IAwesomeMessage ()

@end

@implementation B4IAwesomeMessage
{

}

//NSString *msgDEMO = @"** DONATIONWARE ** ";
NSString *msgDEMO = @"";

-(void)Initialize:(B4I*)bi :(NSString *)EventName {
    [B4IObjectWrapper setBIAndEventName:self :bi :EventName];
   
  //*********************************************************************************
    _Author = @"Alberto Iglesias (alberto@visualnet.inf.br)";
    _Version = @"1.0.0";
  //*********************************************************************************
    
    NSString *clientID = [UIDevice currentDevice].identifierForVendor.UUIDString;
    
    if(_DebugMode) NSLog(@"UUID: %@", clientID);
    
    [NSThread detachNewThreadSelector:@selector(RetornoMensagem:) toTarget:self withObject:EventName];

    
}


-(void)RetornoMensagem:(NSString *)pMensagem
{
    if(_DebugMode) NSLog(@"RetornoMensagem: %@",pMensagem);
    [B4IObjectWrapper raiseEventFromDifferentThread:self :@"_oninitialized:" :@[pMensagem]];
}

-(void)RetornoHide:(NSString *)pMensagem
{
    if(_DebugMode) NSLog(@"RetornoMensagem: %@",pMensagem);
    [B4IObjectWrapper raiseEventFromDifferentThread:self :@"_onhide:" :@[pMensagem]];
}


#pragma mark - ********** ⬇ Funcoes ⬇ **********

- (NSString *)FU_Trim:(NSString *)pTexto
{
    return [pTexto stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma mark - ********** RNGridMenu - Menu Suspenso com Blur ***************


- (void)ShowMessage:(B4I*)bi :(B4IPage *)Parent :(NSString *)Title :(NSString *)Message :(Boolean)ButtonRight {
    
    
    RNBlurModalView *modal = [[RNBlurModalView alloc] initWithViewController:Parent.object title:Title message:Message];
    
    
    modal.defaultHideBlock = ^{
            if(_DebugMode) NSLog(@"[ShowMessage] Code called after the modal view is hidden");
        [NSThread detachNewThreadSelector:@selector(RetornoHide:) toTarget:self withObject:Title];

    };

    
    modal.dismissButtonRight = ButtonRight;

    [modal show];
    
    
}

@end
