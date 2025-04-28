import { assertEquals } from "@std/assert";
import { uniqueCount } from "./main.ts";

Deno.test(function uniqueCountTest() {
  assertEquals(uniqueCount([1, 3, 1, 4, 1, 5]), 4);
});
