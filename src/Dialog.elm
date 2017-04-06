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
            , ( "left", "0" )
            , ( "width", "100%" )
            , ( "height", "100%" )
            , ( "pointer-events", "none" )
            , ( "opacity", "0" )
            , ( "transition", "opacity .2s .2s ease-in" )
            ]

        additionalStyle =
            if model.open == True then
                [ ( "position", "fixed" )
                , ( "pointer-events", "all" )
                , ( "opacity", "1" )
                , ( "transition", "opacity .2s ease-out" )
                ]
            else
                []
    in
        style (basicStyle ++ additionalStyle)


content : Model -> Html msg -> Html msg
content model children =
    Html.div [ contentStyle model ] [ children ]


contentStyle : Model -> Html.Attribute msg
contentStyle model =
    let
        basicStyle =
            [ ( "position", "fixed" )
            , ( "top", "0" )
            , ( "left", "50%" )
            , ( "width", "800px" )
            , ( "margin-left", "-400px" )
            , ( "transform", "translateY(-100%)" )
            , ( "transition", "transform .2s ease-in" )
            ]

        additionalStyle =
            if model.open == True then
                [ ( "transform", "translateY(50px)" )
                , ( "transition", "transform .2s .1s ease-out" )
                ]
            else
                []
    in
        style (basicStyle ++ additionalStyle)
