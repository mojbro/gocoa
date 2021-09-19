#import <Foundation/Foundation.h>

// typedef void (*callback)(void);
typedef void* UserDefaultsPtr;

UserDefaultsPtr UserDefaults_New();

void UserDefaults_SetString(UserDefaultsPtr defaultsPtr, const char*key, const char*value);

const char* UserDefaults_GetString(UserDefaultsPtr defaultsPtr, const char*key);