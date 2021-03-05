module Page.Home exposing (view)

import Html exposing (Html, div, h1, text)



-- VIEW


view : { title : String, content : Html msg }
view =
    { title = "Home Page"
    , content =
        div []
            [ h1 [] [ text "Home Page" ]
            , text "Welcome Home!"
            ]
    }
