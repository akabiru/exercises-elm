import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main : Program Never
main =
    App.beginnerProgram{ model = model, update = update, view = view }


{- Model
Define STATE of your app -}

type alias Model =
    { name : String
    , password : String
    , passwordConfirmation : String
    }

model : Model
model =
    Model "" "" ""


{- Update
Actions that can UPDATE the state (model)
And return the model
-}

type Msg
 = Name String
 | Password String
 | PasswordConfirmation String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }
        Password password ->
            { model | password = password }
        PasswordConfirmation passwordConfirmation ->
            { model | passwordConfirmation = passwordConfirmation }

{- View
Render the CURRENT STATE
Take a state (model) and return Html (msg)
-}

view : Model -> Html Msg
view model =
    div [ class "container" ]
    [ input [ type' "text", class "name", placeholder "name", onInput Name ] []
    , input [ type' "password", class "password", placeholder "password", onInput Password ] []
    , input [ type' "password", class "password-confrimation", placeholder "password confirmation", onInput PasswordConfirmation ] []
    , confirmPassword model
    ]

confirmPassword : Model -> Html msg
confirmPassword model =
    let
     (color, message) =
        if model.password == model.passwordConfirmation then
            ("green", "Great!")
        else
            ("red", "Password don't match.")
    in
        div [ style [("color", color)] ] [ text message]

