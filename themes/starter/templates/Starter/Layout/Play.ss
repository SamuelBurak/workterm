<%-- title for content inside circle --%>
<h1 class="title whiteFont">$SemiTitle</h1>

<%-- css semicircle below banner --%>
<div class="semicircle bgOrange noBorder"></div>

<%-- Begin Main Content --%>
<main class="pageContainer gap-3">

    <div>
        <%-- main header and subheader --%>
        <h2 class="bold">$Header</h2>
        <p>$SubheaderContent</p>
        <button class="mt-2">See More > </button>
    </div>

    <hr>

    <%-- container to hold image, image title, and image description --%>
    <div class="myContainer autoMargin w-80 alignLeft gap-1 justifyCenter responsiveWrapReverse">
        <div>
            <%-- image --%>
            <% with $Image1 %>
                <picture>
                    <source srcset="$FitMax(300,300).URL" media="(min-width: 800px)" width="300" height="300">
                    <img class="responsive rounded" src="$FitMax(300,300).WebP.URL" alt="$Top.Image1Alt" loading="lazy" width="300" height="300"/>
                </picture>
            <% end_with %>
        </div>
        <div class="responsiveAlignCenter">
            <%-- image title --%>
            <h3 class="bold blue fSize-2half">$Image1Title</h3>
            <%-- image description --%>
            <p class="blue">$Image1Description</p>
        </div>
    </div>
    <hr>

    <%-- center content --%>
    <div>
        <%-- title --%>
        <h3 class="bold">$MiddleTitle</h3>
        <%-- description --%>
        <p>$MiddleContent</p>

        <button class="mt-2">See more > </button>
    </div>
    <hr>

    <%-- promotional quote --%>
    <div>
        <blockquote class="bold">$Quote</blockquote> <br>
    </div>

    <hr>

    <%-- container to hold image, image title, and image description --%>
    <div class="myContainer autoMargin w-80 alignLeft gap-2 justifyCenter">
        <div class="responsiveAlignCenter">
            <%-- image title --%>
            <h3 class="bold blue fSize-2half">$Image2Title</h3>
            <%-- image description --%>
            <p class="blue">$Image2Description</p>
        </div>
        <div>
            <%-- image --%>
            <% with $Image2 %>
                <picture>
                    <source srcset="$FitMax(300,300).URL" media="(min-width: 800px)" width="300" height="300">
                    <img class="responsive rounded" src="$FitMax(300,300).WebP.URL" alt="$Top.Image2Alt" loading="lazy" width="300" height="300"/>
                    <img class="responsive rounded" src="$FitMax(300,300).URL" alt="$Top.Image2Alt" loading="lazy" width="300" height="300"/>
                </picture>
            <% end_with %>
        </div>
    </div>

</main>
