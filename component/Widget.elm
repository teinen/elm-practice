module Widget exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)



-- MODEL
type alias Model =
    {
      count : Int
    }

initialModel : Model
initialModel =
    {
      count = 0
    }



-- MESSAGE
type Msg
    = Increase



-- VIEW
view : Model -> Html Msg
view model =
    div []
    [ div [] [ text (toString model.count) ]
    , button [ onClick Increase ] [ text "Click" ]
    ]



-- UPDATE
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increase ->
            ( { model | count = model.count + 1 }, Cmd.none )
