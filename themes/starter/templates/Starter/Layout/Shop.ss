<%-- image with overlay, text, and circle with text --%>
<div class="overlay" >
    <nav class="menuContainer">
        <div class="flexGrow">
            <img class="autoWidthHeight autoMargin" src="$ThemeDir/images/footerIcon.svg" alt="company logo" width="150" height="100">
        </div>
        <div>
            <i class="fas fa-search p-60p open-button"></i>
            <% if $SearchForm %>
                $SearchForm
            <% end_if %>
            <a href="#" id="mobile-menu-trigger" title="Menu"><i class="fas fa-bars"></i></a>
        </div>
    </nav>
    <%-- circle on the right side of the page with title and description --%>
    <%-- circle --%>
    <div class="sideCircle"></div>
    <div class="sideCircleText">
        <%-- title --%>
        <h2>$CircleTitle</h2>
        <%-- description --%>
        <p class="bold">$CircleSubtitle</p>
    </div>
    <%-- banner image --%>
    <% with $Banner %>
        <picture>
            <source srcset="$Fill(1920,1080).WebP.URL" media="(min-width: 800px)" loading="lazy" width="1920" height="1080" >
            <img src="$Fill(1920,1080).URL" alt="$Top.BannerAlt" loading="lazy" width="1920" height="1080" />
            <img src="$Fill(1920,1080).WebP.URL" alt="$Top.BannerAlt" loading="lazy" width="1920" height="1080" />
        </picture>
    <% end_with %>
    <%-- navigation on left of page (only on this page) --%>
    <ul class="banner-links">
        <% loop $Menu(1) %>
            <li>
                <a href="$Link">$MenuTitle.XML</a>
            </li>
        <% end_loop %>
    </ul>
</div>

<%-- move circle text below when in mobile --%>
<h1 class="circleTitle">$CircleTitle</h1>

<%-- css semicircle --%>
<div class="shopCircle"></div>

<%-- header for content which will be inside semicircle --%>
<h2 class="alignCenter mt-2 mb-2">$Header</h2>

<%-- Begin Main Content --%>
<main>
    <%-- grid to contain all items --%>
    <div class="gridContainer">
        <% if $ShopData %>
            <% loop $ShopData %>
                <div class="parent">
                    <%-- image inside grid --%>
                    <% with $Image %>
                        <picture>
                            <source srcset="$FitMax(300,300).URL" media="(min-width: 800px)" width="300" height="300">
                            <img class="responsive autoMargin" src="$FitMax(300,300).WebP.URL" alt="$Up.ImageAlt" loading="lazy" width="300" height="300"/>
                        </picture>
                    <% end_with %>
                    <%-- dot which will appear on the bottom right of the image --%>
                    <span class="dot whiteFont bold">$DotName.LimitCharacters(9)</span>
                    <div class="ml-1">
                        <%-- title of item --%>
                        <h4 class="noMarginBottom">$Title</h4>
                        <%-- description of item --%>
                        $Content
                        <button>See more > </button>
                    </div>
                </div>
            <% end_loop %>
        <% end_if %>
    </div>

    <hr class="mb-3">

    <%-- promotional quote --%>
    <div class="w-80 autoMargin alignCenter">
        <blockquote>$Quote</blockquote> <br>
    </div>

    <hr class="mb-3">

    <div class="mb-5">
        <%-- image at bottom of page --%>
        <% with $BottomImage %>
            <picture>
                <source srcset="$URL" media="(min-width: 800px)" width="300" height="300">
                <img class="block autoMargin responsive" src="$Fill(1920,1080).WebP.URL" alt="$Top.BottomImageAlt" loading="lazy" width="300" height="300"/>
            </picture>
        <% end_with %>
    </div>

</main>
