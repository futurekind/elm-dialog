module Main exposing (..)

import Dialog
import Html exposing (Html)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)


-- Model


type alias Model =
    { dialog : Dialog.Model }


model : Model
model =
    { dialog = Dialog.init }



-- Update


type Msg
    = OpenDialog
    | CloseDialog


update : Msg -> Model -> Model
update msg model =
    case msg of
        OpenDialog ->
            let
                dialog =
                    model.dialog

                newDialog =
                    { dialog | open = True }
            in
                { model | dialog = newDialog }

        CloseDialog ->
            let
                dialog =
                    model.dialog

                newDialog =
                    { dialog | open = False }
            in
                { model | dialog = newDialog }



-- View


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.button
            [ onClick OpenDialog
            ]
            [ Html.text "Open from Main" ]
        , Dialog.backdrop model.dialog CloseDialog
        , Dialog.content model.dialog dialogContent
        ]


dialogContent : Html Msg
dialogContent =
    Html.div
        [ style
            [ ( "height", "800px" )
            , ( "background", "#fff" )
            ]
        ]
        [ Html.button [ onClick CloseDialog ] [ Html.text "Close" ] ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }
