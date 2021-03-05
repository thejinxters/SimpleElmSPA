module Page.SimplePage exposing (view)

import Html exposing (Html)

-- VIEW

view : { title : String, content : Html msg }
view =
    { title = "Simple Page"
    , content = Html.text "This is just a simple page"
    }
