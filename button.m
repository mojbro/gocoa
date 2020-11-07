#import "button.h"
#include "_cgo_export.h"

@implementation ButtonHandler
-(void) buttonClicked:(id) sender
{
    onButtonClicked([self goButtonID]);
}
@end

ButtonPtr Button_New(int goButtonID, int x, int y, int w, int h)
{
    id nsButton = [[[NSButton alloc] initWithFrame:NSMakeRect(x, y, w, h)] autorelease];
    ButtonHandler* handler = [[ButtonHandler alloc] init];
    [handler setGoButtonID:goButtonID];
    [handler autorelease];
    [nsButton setTarget:handler];
    [nsButton setAction:@selector(buttonClicked:)];

    [nsButton setButtonType:NSMomentaryLightButton];
    [nsButton setBezelStyle:NSRoundedBezelStyle];

    return (ButtonPtr)nsButton;
}

void Button_SetTitle(ButtonPtr btnPtr, const char* title)
{
    NSButton* button = (NSButton*)btnPtr;
    [button setTitle:[NSString stringWithUTF8String:title]];
}

void Button_Remove(ButtonPtr btnPtr) 
{
    NSButton* button = (NSButton*)btnPtr;
    [button removeFromSuperview];
}