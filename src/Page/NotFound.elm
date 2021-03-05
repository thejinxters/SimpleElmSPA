module Page.NotFound exposing (..)

import Html exposing (Html)

-- VIEW

view : { title : String, content : Html msg }
view =
    { title = "404 Not Found"
    , content = Html.text "Sorry, this page doesn't exist"
    }
