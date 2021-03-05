module Page.Home exposing (view)

import Html exposing (Html)

-- VIEW

view : { title : String, content : Html msg }
view =
    { title = "Home Page"
    , content = Html.text "Welcome Home!"
    }
