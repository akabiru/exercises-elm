module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App


-- Model
-- Initial state of the app


type alias Model =
    Int


initModel : Model
initModel =
    0



-- Update


type Msg
    = AddCalorie
    | RemoveCalorie
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCalorie ->
            model + 1

        RemoveCalorie ->
          if model > 0 then
            model - 1
          else
            initModel

        Clear ->
            initModel



-- View


view : Model -> Html Msg
view model =
    div [ class "my-class" ]
        [ h3 []
            [ text ("Total Calories: " ++ (toString model)) ]
        , input [ type' "text" ] []
        , button
            [ type' "button"
            , onClick AddCalorie
            ]
            [ text "Add" ]
        , button
            [ type' "button"
            , onClick RemoveCalorie
            ]
            [ text "Remove" ]
        , button
            [ type' "button"
            , onClick Clear
            ]
            [ text "Clear" ]
        ]


main : Program Never
main =
    App.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
