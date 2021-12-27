module Page.Named.Color_ exposing (Data, Model, Msg, page)

import ColorHelpers
import DataSource exposing (DataSource)
import Page exposing (Page, PageWithState, StaticPayload)


type alias Model =
    {}


type alias Msg =
    Never


type alias RouteParams =
    { color : String }


type alias Data =
    ColorHelpers.Data


page : Page RouteParams Data
page =
    Page.preRenderWithFallback
        { head = ColorHelpers.head toCssVal
        , pages = pages
        , data = ColorHelpers.data
        }
        |> Page.buildNoState { view = ColorHelpers.view toCssVal }


toCssVal : RouteParams -> String
toCssVal routeParams =
    routeParams.color


pages : DataSource (List RouteParams)
pages =
    DataSource.succeed []
