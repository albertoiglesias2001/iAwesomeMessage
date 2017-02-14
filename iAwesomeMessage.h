
/*
 *********************************************************************************
 Created by Alberto Iglesias (alberto@visualnet.inf.br)
 Copyright (c) 1999-2017 by Visual Net. All rights reserved.
 www.vnsoft.es
 www.visualnet.inf.br
 *********************************************************************************
 */

#import <Foundation/Foundation.h>
#import "iCore.h"

@class B4I;
//~shortname:AwesomeMessage
//~event:onInitialized(EventName As String)
//~event:onHide (Title as String)
//~version:1.00
//~author:Alberto Iglesias (alberto@visualnet.inf.br)

@interface B4IAwesomeMessage : NSObject

//Enable/Disable Debug mode from Library
@property (nonatomic, readwrite)BOOL DebugMode;

//Author of this Library
@property (nonatomic, readonly)NSString *Author;

//Library Version
@property (nonatomic, readonly)NSString *Version;

//Initializes the object.
- (void)Initialize:(B4I *)bi :(NSString *)EventName;

//Show the message
- (void)ShowMessage:(B4I*)bi :(B4IPage *)Parent :(NSString *)Title :(NSString *)Message :(Boolean)ButtonRight;


@end
