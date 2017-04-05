module Main exposing (..)

import Dialog
import Html exposing (Html)
import Html.Events exposing (onClick)


-- Model


type alias Model =
    { dialog : Dialog.Model }


model : Model
model =
    { dialog = Dialog.model }



-- Update


type Msg
    = OpenDialog


update : Msg -> Model -> Model
update msg model =
    case msg of
        OpenDialog ->
            let
                foo =
                    Dialog.update Dialog.Open Dialog.model
            in
                { model | dialog = foo }



-- View


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.button
            [ onClick OpenDialog
            ]
            [ Html.text "Open from Main" ]
        , Dialog.view model.dialog
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }
