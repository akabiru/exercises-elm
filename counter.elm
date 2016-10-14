module Main exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Events exposing (..)
import Html.Attributes exposing (..)


main : Program Never
main =
    App.beginnerProgram
        { model = model
        , update = update
        , view = view
        }



-- Model


type alias Model =
    Int


model : Model
model =
    0



-- Update


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            if model > 0 then
                model - 1
            else
                model



-- View


view : model -> Html Msg
view model =
    div []
        [ h1 [] [ text ("Counter at: " ++ (toString model)) ]
        , button
            [ type' "button"
            , onClick Increment
            ]
            [ text "Increment +" ]
        , button
            [ type' "button"
            , onClick Decrement
            ]
            [ text "Decrement -" ]
        ]
