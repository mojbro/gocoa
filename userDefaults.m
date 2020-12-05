#import "userDefaults.h"
#include "_cgo_export.h"

UserDefaultsPtr UserDefaults_New()
{
    id nsUserDefaults = [NSUserDefaults standardUserDefaults];
    return (UserDefaultsPtr)nsUserDefaults;
}

void UserDefaults_SetString(UserDefaultsPtr defaultsPtr, const char *key, const char *value)
{
    NSUserDefaults* defaults = (NSUserDefaults*)defaultsPtr;
    [defaults setObject:[NSString stringWithUTF8String:value] forKey:[NSString stringWithUTF8String:key]];
    [defaults synchronize];
}

const char* UserDefaults_GetString(UserDefaultsPtr defaultsPtr, const char *key) {
    NSUserDefaults* defaults = (NSUserDefaults*)defaultsPtr;
    NSString *value = [defaults stringForKey:[NSString stringWithUTF8String:key]];
    const char *cValue = [value UTF8String];
    return cValue;
}