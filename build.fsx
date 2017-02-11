#r "packages/Suave/lib/net40/Suave.dll"
#r "packages/FAKE/tools/FakeLib.dll"
#load "app.fsx"
open App
open Fake
open System
open System.IO
open Suave
open Suave.Logging
open Suave.Http
open Suave.Web

let serverConfig =
  { defaultConfig with
      bindings = [ HttpBinding.createSimple HTTP  "127.0.0.1" 8080] }

Target "run" (fun _ ->
    startWebServer serverConfig app
)

RunTargetOrDefault "run"