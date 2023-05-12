module Main exposing (..)

import Browser exposing (..)
import Browser.Navigation as Nav
import Html exposing (Html, button, div, hr, span, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
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
    | ClickedLink UrlRequest


update : Msg -> Int -> ( Int, Cmd msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )

        ClickedLink urlRequest ->
            case urlRequest of
                Internal url ->
                    -- ( 0, Nav.pushUrl 0 (Url.toString url) )
                    ( 0, Cmd.none )

                External url ->
                    -- ( 0, Nav.load url )
                    ( 0, Cmd.none )


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
