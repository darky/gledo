import { Some, None } from "../gleam_stdlib/gleam/option.mjs";

export const isSome = x => x instanceof Some;

export const isNone = x => x instanceof None;
