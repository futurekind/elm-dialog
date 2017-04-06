module Dialog exposing (..)

import Html exposing (Html)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


-- Model


type alias Model =
    { open : Bool }


init : Model
init =
    { open = False }



-- View


backdrop : Model -> msg -> Html msg
backdrop model msg =
    Html.div [ backdropStyles model, onClick msg ] []


backdropStyles : Model -> Html.Attribute msg
backdropStyles model =
    let
        basicStyle =
            [ ( "position", "absolute" )
            , ( "background", "rgba(0, 0, 0, .5)" )
            , ( "top", "0" )
            , ( "left", "-9999px" )
            , ( "width", "100%" )
            , ( "height", "100%" )
            , ( "opacity", "0" )
            , ( "transition", "opacity .2s ease-out" )
            ]

        additionalStyle =
            if model.open == True then
                [ ( "position", "fixed" )
                , ( "left", "0" )
                , ( "opacity", "1" )
                ]
            else
                []
    in
        style (basicStyle ++ additionalStyle)


content : Model -> Html msg
content model =
    Html.div [ contentStyle model ] []


contentStyle : Model -> Html.Attribute msg
contentStyle model =
    let
        basicStyle =
            [ ( "position", "fixed" )
            , ( "top", "0" )
            , ( "left", "50%" )
            , ( "width", "800px" )
            , ( "height", "400px" )
            , ( "margin-left", "-400px" )
            , ( "background-color", "#fff" )
            , ( "transform", "translateY(-100%)" )
            , ( "transition", "transform .2s .1s" )
            ]

        additionalStyle =
            if model.open == True then
                [ ( "transform", "translateY(50px)" )
                ]
            else
                []
    in
        style (basicStyle ++ additionalStyle)
