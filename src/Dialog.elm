module Dialog exposing (view, model, update, Msg(..), Model)

import Html exposing (Html)
import Html.Events exposing (onClick)


-- Model


type alias Model =
    { open : Bool }


model : Model
model =
    { open = False }



-- Update


type Msg
    = Open
    | Close


update : Msg -> Model -> Model
update msg model =
    case msg of
        Open ->
            { model | open = True }

        Close ->
            { model | open = False }



-- View


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.button
            [ onClick Close
            ]
            [ Html.text "Close from Dialog" ]
        , Html.pre [] [ toString model |> Html.text ]
        ]


main =
    Html.beginnerProgram { model = model, view = view, update = update }
