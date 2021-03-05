module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Page.Home as Home
import Page.NotFound as NotFound
import Page.SimplePage as SimplePage
import Route exposing (Route, toRoute)
import Url



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }



-- MODEL


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , route : Route
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    ( Model key url (toRoute (Url.toString url)), Cmd.none )



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( { model | route = toRoute (Url.toString url) }
                    , Nav.pushUrl model.key (Url.toString url)
                    )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | url = url, route = toRoute (Url.toString url) }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
    let
        viewInfo = getDisplayInfo model
    in
    { title = viewInfo.title
    , body =
        [ nav
        , viewInfo.content
        ]
    }


nav : Html Msg
nav =
    ul []
        [ viewLink "/"
        , viewLink "/simple-page"
        ]


getDisplayInfo : Model -> { title : String, content : Html msg }
getDisplayInfo model =
    case model.route of
        Route.Root ->
            Home.view

        Route.SimplePage ->
            SimplePage.view

        Route.NotFound ->
            NotFound.view


viewLink : String -> Html msg
viewLink path =
    li [] [ a [ href path ] [ text path ] ]
