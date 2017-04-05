module Main exposing (..)

import Dialog
import Html exposing (Html)
import Html.Events exposing (onClick)


-- Model


type alias Model =
    { dialog : Dialog.Model
    }


model : Model
model =
    { dialog = Dialog.model
    }



-- Update


type Msg
    = OpenDialog


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OpenDialog ->
            let
                prevDialog =
                    model.dialog

                newDialog =
                    { prevDialog | open = True }
            in
                ( { model | dialog = newDialog }, Cmd.none )



-- View


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.button
            [ onClick OpenDialog
            ]
            [ Html.text "Open" ]
        , Dialog.view model.dialog
        ]


main : Program Never Model Msg
main =
    Html.program
        { init = ( model, Cmd.none )
        , view = view
        , update = update
        , subscriptions = \model -> Sub.none
        }
