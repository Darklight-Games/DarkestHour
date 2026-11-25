//==============================================================================
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================

class JSONValue extends Object
    abstract;

function bool IsString();
function bool IsNull();
function bool IsNumber();
function bool IsBoolean();
function bool IsObject();
function bool IsArray();

function string AsString();
function JSONNumber AsNumber();
function int AsInteger();
function float AsFloat();
function bool AsBoolean();
function JSONObject AsObject();
function JSONArray AsArray();

function string Encode() { return "null"; }

static function string GetSanitizedString(string S)
{
    S = Repl(S, "\\", "\\\\");
    S = Repl(S, "\"", "\\\"");
    return S;
}

