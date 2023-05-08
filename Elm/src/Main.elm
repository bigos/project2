module Main exposing (..)

import Browser
import Html exposing (Html, button, div, hr, span, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import List


main =
    Browser.sandbox { init = 0, update = update, view = view }



-- we ignore Text creation times for now


type alias Text =
    { id : String
    , link : String
    , body : String
    }


type Msg
    = Increment
    | Decrement


update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1


view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , span [ class <| counterClasses model ] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+" ]
        , hr [] []
        ]


counterClasses model =
    let
        counterValue =
            model

        counterColorClass =
            if counterValue >= 0 then
                "positive"

            else
                "negative"

        counterClasses2 =
            String.join " " [ "counter", counterColorClass ]
    in
    counterClasses2
