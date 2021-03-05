module Page.SimplePage exposing (view)

import Html exposing (Html, div, h1, text)



-- VIEW


view : { title : String, content : Html msg }
view =
    { title = "Simple Page"
    , content =
        div []
            [ h1 [] [ text "Simple Page" ]
            , text "This is just a simple page"
            ]
    }
