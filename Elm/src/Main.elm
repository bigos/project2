module Main exposing (..)

import Browser exposing (..)
import Browser.Navigation as Nav
import Html exposing (Html, button, div, hr, span, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Http
import Json.Decode exposing (..)
import List
import Url


main =
    -- Browser.sandbox { init = 0, update = update, view = view }
    Browser.document
        { init = init
        , subscriptions = \_ -> Sub.none
        , update = update
        , view = view
        }


init () =
    ( 0, Cmd.none )



-- we ignore Text creation times for now


type alias Text =
    { id : String
    , link : String
    , body : String
    }


type Msg
    = Increment
    | Decrement
    | GotText (Result Http.Error String)


update : Msg -> Int -> ( Int, Cmd msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )

        GotText res ->
            Debug.log (Debug.toString res)
                ( model, Cmd.none )


view : Int -> Document Msg
view model =
    { title = "first title"
    , body =
        [ div [] []
        , div
            []
            [ button [ onClick Decrement ] [ text "-" ]
            , span [ class <| counterClasses model ] [ text (String.fromInt model) ]
            , button [ onClick Increment ] [ text "+" ]
            , hr [] []
            ]
        , div [] []
        ]
    }


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



-- HTTP


getText : Cmd Msg
getText =
    Http.get
        { url = "finish me"
        , expect = Http.expectString GotText
        }
