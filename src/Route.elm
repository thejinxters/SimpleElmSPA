module Route exposing (Route(..), toRoute)

import Url
import Url.Parser exposing (Parser, map, oneOf, parse, s, string, top)


type Route
    = Root
    | Page
    | NotFound


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Root top
        , map Page (s "simple-page")
        ]


toRoute : String -> Route
toRoute string =
    case Url.fromString string of
        Nothing ->
            Root

        Just url ->
            Maybe.withDefault NotFound (parse routeParser url)
