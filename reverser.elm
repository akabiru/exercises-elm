module Main exposing (..)

import Html exposing (Html, Attribute, div, textarea, text)
import Html.Attributes exposing (..)
import Html.App as App
import Html.Events exposing (onInput)
import String


main : Program Never
main =
    App.beginnerProgram { model = model, update = update, view = view }



-- Model


type alias Model =
    { content : String }


model : Model
model =
    { content = "" }



-- Update


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent }



-- View


view : Model -> Html Msg
view model =
    div []
        [ textarea [ placeholder "String to reverse", onInput Change ] []
        , div []
            [ text (String.reverse model.content) ]
        ]
