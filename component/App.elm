module App exposing (..)

import Html exposing (Html, program)
import Widget



-- MODEL
type alias AppModel =
    { widgetModel : Widget.Model
    }

initialModel : AppModel
initialModel =
    { widgetModel = Widget.initialModel
    }

init : ( AppModel, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- MESSAGE
type Msg
    = WidgetMsg Widget.Msg



-- VIEW
view : AppModel -> Html Msg
view model =
    Html.div []
    [
      Html.map WidgetMsg ( Widget.view model.widgetModel )
    ]



-- UPDATE
update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update msg model =
    case msg of
        WidgetMsg subMsg ->
            let
                ( updatedWidgetModel, widgetCmd ) =
                    Widget.update subMsg model.widgetModel
            in
                ( { model | widgetModel = updatedWidgetModel }, Cmd.map WidgetMsg widgetCmd )



-- SUBSCRIPTIONS
subscriptions : AppModel -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN
main : Program Never AppModel Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }