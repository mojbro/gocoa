package gocoa

import (
	"testing"
)

func TestNewPUserDefaults(t *testing.T) {
	defaults := NewPUserDefaults()
	if defaults.userDefaultsPtr == nil {
		t.Fatalf("pointer to C defaults is nil!")
	}
}

func TestStringValue(t *testing.T) {
	defaults := NewPUserDefaults()
	value := "FooBar!"
	defaults.SetString("TestKey", value)
	readValue := defaults.GetString("TestKey")
	if readValue != value {
		t.Fatalf("read value should be %s, but is %s", value, readValue)
	}
}
