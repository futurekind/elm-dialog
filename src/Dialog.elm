module Dialog exposing (view, model, Model)

import Html exposing (Html)


-- Model


type alias Model =
    { open : Bool }


model : Model
model =
    { open = False }



-- View


view : Model -> Html msg
view model =
    Html.div []
        [ Html.pre [] [ toString model |> Html.text ]
        ]
