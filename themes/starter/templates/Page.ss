<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
    <head>
        <title>$Title.XML - $SiteConfig.Title.XML<% if $SiteConfig.Tagline %> - $SiteConfig.Tagline.XML<% end_if %></title>

        $MetaTags(false)
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>

        <% base_tag %>

        <% require themedCSS(webfonts/fontawesome/fontawesome-all.min) %>
        <% require themedCSS(layout) %>
        <% require themedCSS(typography) %>
        <% require themedCSS(menu) %>
        <% require themedCSS(form) %>
        <% require themedCSS(responsive) %>

    </head>
    <body id="body" class="typography">
        <header id="Header" class="inner">
            <% include Header %>
            <% include Navigation %>
            <% if $ClassName != "Starter\Shop" && $Title != "Search Results" %>
                <% include Banner %>
            <% end_if %>
        </header>

        <div id="Content" class="inner" role="main">
            $Layout
            <% include Footer %>
        </div>

        <script type="text/javascript"></script>
    </body>
</html>
